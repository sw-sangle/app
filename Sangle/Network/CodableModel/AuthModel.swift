//
//  AuthModel.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/23/24.
//

struct VerifySmsModel: Decodable {
    let targetPhoneNumber: String
}

struct ConfirmSmsModel: Decodable {
    let isExist: Bool
    let accessToken: String
    let isConfirmed: Bool
}

struct RegisterModel: Decodable {
    let id: String
    let name: String
    let phoneNumber: String
    let accessToken: String
}

struct MeModel: Decodable {
    let id: String
    let name: String
    let phoneNumber: String
    let familySize: Int
    let birthDateYear: Int
    let birthDateMonth: Int
    let birthDateDay: Int
}
