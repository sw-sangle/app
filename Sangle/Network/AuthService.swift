//
//  AuthServiceProtocol.swift
//  Pickr
//
//  Created by  jwkwon0817 on 11/11/24.
//
import Foundation
import Alamofire


protocol AuthServiceProtocol {
    static func verifySms(_ phoneNumber: String) async throws -> VerifySmsModel
}


class AuthService: AuthServiceProtocol {
    static func verifySms(_ phoneNumber: String) async throws -> VerifySmsModel {
        return try await APIClient.shared.request("/api/phone-verification/\(phoneNumber)", method: .post)
    }
    
    static func confirmSms(_ )
}
