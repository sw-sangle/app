//
//  KeychainHelper.swift
//  Pickr
//
//  Created by  jwkwon0817 on 11/11/24.
//

import Foundation
import Security

class KeychainHelper {
    static let serviceName = "Ourry"
    
    @discardableResult
    static func create(token: String, forAccount account: String) -> Bool {
        
        let keychainItem = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: account,
            kSecAttrService: serviceName,
            kSecValueData: token.data(using: .utf8) as Any
        ] as [String: Any]
        
        // Add the password to the keychain.
        let status = SecItemAdd(keychainItem as CFDictionary, nil)
        guard status == errSecSuccess else {
            print("Keychain create Error")
            return false
        }
        return true
    }
    
    static func read(forAccount account: String) -> String? {
        let keychainItem = [
                    kSecClass: kSecClassGenericPassword,
                    kSecAttrAccount: account,
                    kSecAttrService: serviceName,
                    kSecReturnData: true
                ] as [String: Any]
        
        var item: AnyObject?
        let status = SecItemCopyMatching(keychainItem as CFDictionary, &item)
        if status == errSecSuccess {
            return String(data: item as! Data, encoding: .utf8)
        }
        
        if status == errSecItemNotFound {
            print("The token was not found in keychain")
            return nil
        } else {
            print("Error getting token from keychain: \(status)")
            return nil
        }
    }
    
    @discardableResult
        static func update(token: String, forAccount account: String) -> Bool{
            let keychainItem = [
                kSecClass: kSecClassGenericPassword
            ] as [String: Any]

            let attributes = [
                kSecAttrService: serviceName,
                kSecAttrAccount: account,
                kSecValueData: token.data(using: .utf8) as Any
            ]

            let status = SecItemUpdate(keychainItem as CFDictionary, attributes as CFDictionary)
            guard status != errSecItemNotFound else {
                print("The token was not found in keychain")
                create(token: token, forAccount: account)
                return true
            }

            guard status == errSecSuccess else {
                print("Keychain update Error")
                return false
            }
            
            print("The token in keychain is updated")
            return true
        }
    
    @discardableResult
        static func delete(forAccount account: String) -> Bool{
            let keychainItem = [
                kSecClass: kSecClassGenericPassword,
                kSecAttrService: serviceName,
                kSecAttrAccount: account
            ] as [String: Any]

            let status = SecItemDelete(keychainItem as CFDictionary)
            guard status != errSecItemNotFound else {
                print("The token was not found in keychain")
                return false
            }
            guard status == errSecSuccess else {
                print("Keychain delete Error")
                return false
            }
            print("The token in keychain is deleted")
            return true
        }
}
