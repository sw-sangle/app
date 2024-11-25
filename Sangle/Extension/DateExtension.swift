//
//  DateExtension.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/22/24.
//
import Foundation

extension Date {
    // 특정 기간 전/후 날짜 얻기
    func adding(days: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: days, to: self) ?? self
    }
    
    // 날짜 포맷팅
    func formatted(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    // 년/월/일 가져오기
    var year: Int {
        return Calendar.current.component(.year, from: self)
    }
    
    var month: Int {
        return Calendar.current.component(.month, from: self)
    }
    
    var day: Int {
        return Calendar.current.component(.day, from: self)
    }
    
    static func from(year: Int, month: Int, day: Int) -> Date {
        let components = DateComponents(year: year, month: month, day: day)
        return Calendar.current.date(from: components) ?? Date()
    }
    
    func toKoreanDateString() -> String {
       let dateFormatter = DateFormatter()
       dateFormatter.locale = Locale(identifier: "ko_KR")
       dateFormatter.dateFormat = "M월 d일 (E)"
       return dateFormatter.string(from: self)
    }
    
    var onlyDate: Date {
            let component = Calendar.current.dateComponents([.year, .month, .day], from: self)
            return Calendar.current.date(from: component) ?? Date()
        }
}

extension Calendar {
    func getDateGap(from: Date, to: Date) -> Int {
        let fromDateOnly = from.onlyDate
        let toDateOnly = to.onlyDate
        return self.dateComponents([.day], from: fromDateOnly, to: toDateOnly).day ?? 0
    }
}
