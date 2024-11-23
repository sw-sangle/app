//
//  BottomBarViewModel.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/22/24.
//

import Foundation
import Observation

struct AuthMacroConfirmSms {
    let isCorrect: Bool
    let errorMessage: String
    let isExist: Bool
}

@Observable
class AuthMacro {
    var isAuthenticated = true
    
    func register(name: String, birthDate: String, phoneNumber: String, household: Int) async -> Bool {
        do {
            let response = try await AuthService.register(name: name, birthDate: birthDate, phoneNumber: phoneNumber, household: household)
            
            if KeychainHelper.update(token: response.accessToken, forAccount: "accessToken") {
                isAuthenticated = true
                
                return true
            }
            
            return false
        } catch {
            print(error.localizedDescription)
            
            return false
        }
    }
    
    func confirmSms(_ phoneNumber: String, code: String) async -> AuthMacroConfirmSms {
        do {
            let response = try await AuthService.confirmSms(phoneNumber, code: code)
            
            if response.isConfirmed {
                let errorMessage = ""
                
                if response.isExist {
                    if KeychainHelper.update(token: response.accessToken, forAccount: "accessToken") {
                        isAuthenticated = true
                        
                        return AuthMacroConfirmSms(isCorrect: true, errorMessage: errorMessage, isExist: true)
                    } else {
                        return AuthMacroConfirmSms(isCorrect: false, errorMessage: "로그인에 실패했습니다", isExist: true)
                    }
                } else {
                    return AuthMacroConfirmSms(isCorrect: true, errorMessage: errorMessage, isExist: false)
                }
            } else {
                return AuthMacroConfirmSms(isCorrect: false, errorMessage: "인증번호가 맞지 않습니다", isExist: response.isExist)
            }
        } catch {
            print(error.localizedDescription)
            
            return AuthMacroConfirmSms(isCorrect: false, errorMessage: "알수 없는 오류가 발생했습니다", isExist: false)
        }
    }
}
