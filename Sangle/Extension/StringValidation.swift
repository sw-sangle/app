//
//  StringValidation.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/23/24.
//

import SwiftUI

extension String {
    func isValidPhoneNumber() -> Bool {
        let phoneRegex = "^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phonePredicate.evaluate(with: self)
    }
    
    func isBirthString() -> Bool {
           // 8자리 숫자인지 확인
           let birthRegex = "^\\d{8}$"
           let birthPredicate = NSPredicate(format: "SELF MATCHES %@", birthRegex)
           
           guard birthPredicate.evaluate(with: self) else {
               return false
           }
           
           // 년도, 월, 일 추출
           let year = Int(self.prefix(4)) ?? 0
           let month = Int(self.dropFirst(4).prefix(2)) ?? 0
           let day = Int(self.dropFirst(6)) ?? 0
           
           // 현재 년도
           let currentYear = Calendar.current.component(.year, from: Date())
           
           // 유효성 검사
           return year >= 1900 && year <= currentYear &&  // 1900년 이후, 현재 년도 이전
                  month >= 1 && month <= 12 &&           // 1-12월
                  day >= 1 && day <= 31                  // 1-31일
       }
    
    func removeCharacter(_ character: String) -> String {
        return self.replacingOccurrences(of: character, with: "")
    }
    
    func addDotToBirth() -> String {
           let numbers = self.removeCharacter(".")
           guard numbers.count <= 8 else { return numbers }
           
           var result = ""
           numbers.enumerated().forEach { index, char in
               if index == 4 || index == 6 {
                   result += "."
               }
               result += String(char)
           }
           return result
       }
}
