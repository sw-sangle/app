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
    static func confirmSms(_ phoneNumber: String, code: String) async throws -> ConfirmSmsModel
    static func me() async throws -> MeModel
}


class AuthService: AuthServiceProtocol {
    static func verifySms(_ phoneNumber: String) async throws -> VerifySmsModel {
        return try await APIClient.shared.request("/api/phone-verification/\(phoneNumber)", method: .post)
    }
    
    static func confirmSms(_ phoneNumber: String, code: String) async throws -> ConfirmSmsModel {
        return try await APIClient.shared.request("/api/confirm/\(phoneNumber)/\(code)", method: .post)
    }
    
    static func register(name: String, birthDate: String, phoneNumber: String, household: Int) async throws -> RegisterModel {
        let parameters: [String: Any] = [
            "name": name,
            "birthDate": birthDate,
            "phoneNumber": phoneNumber,
            "familySize": household
        ]
        
        return try await APIClient.shared.request("/api/user/register", method: .post, parameters: parameters)
    }
    
    static func me() async throws -> MeModel {
        return try await APIClient.shared.request("/api/user/me", authRequired: true)
    }
}
