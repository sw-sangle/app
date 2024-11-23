//
//  APIClient.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/23/24.
//

import SwiftUI
import Alamofire

class APIClient {
   static let shared = APIClient()
   
    func request<T: Decodable>(_ endpoint: String, method: HTTPMethod = .get, parameters: [String: Any]? = nil, authRequired: Bool = false) async throws -> T {
        let urlString = "\(Network.baseUrl)\(endpoint)"
        
        guard let url = URL(string: urlString) else {
            throw NSError(domain: "Invalid URL", code: -1, userInfo: nil)
        }
        
        // 인증이 필요한 경우 토큰 확인
        var authHeader = ""
        if authRequired {
            guard let token = KeychainHelper.read(forAccount: "accessToken") else {
                throw NSError(domain: "Authentication Error", code: 401, userInfo: [NSLocalizedDescriptionKey: "No access token found"])
            }
            authHeader = "Bearer \(token)"
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(url,
                      method: method,
                      parameters: parameters,
                      encoding: JSONEncoding.default,
                      headers: [
                        "Content-Type": "application/json",
                        "Accept": "application/json",
                        "Authorization": authHeader
                      ])
            .validate()
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let data):
                    continuation.resume(returning: data)
                case .failure(let error):
                    print("Error: \(error)")
                    if let data = response.data {
                        print("Server response (\(endpoint), \(method): \(String(data: data, encoding: .utf8) ?? "nil")")
                    }
                    continuation.resume(throwing: error)
                }
            }
        }
   }
}
