//
//  Ingredient.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/22/24.
//

import SwiftUI

enum IngredientInfoType {
    case plain, detail, warning
}

struct IngredientInfo: View {
    let content: IngredientModel
    let type: IngredientInfoType
    let expirationDate: Date?
    let warningDate: Int?
   
    init(content: IngredientModel, type: IngredientInfoType = .plain, expirationDate: Date? = nil, warningDate: Int? = nil) {
        self.content = content
        self.type = type
        self.expirationDate = expirationDate
        self.warningDate = warningDate
    }
    
    var body: some View {
        if type != .detail {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 0) {
                    Text(content.name)
                        .typography(.body1, color: .Color.black)
                    
                    Text(content.category)
                        .typography(.body2, color: .Gray._500)
                }
                
                Spacer()
                
                if type == .warning {
                    if let warningDate {
                        Text("추천 소비기한\n\(warningDate)일 남음")
                            .typography(.body2, color: .Color.red)
                    }
                } else {
                    if let date = content.date {
                        Text(date.toKoreanDateString())
                            .typography(.body2, color: .Gray._500)
                    }
                }
            }
        } else {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    if let date = content.date {
                        Text(date.toKoreanDateString())
                            .typography(.body2Emphasized, color: .Gray._500)
                    }
                    
                    Text(content.name)
                        .typography(.subtitle1Emphasized, color: .Color.black)
                    
                    Text(content.category)
                        .typography(.body2, color: .Gray._500)
                }
                
                Spacer()
                
                if let expirationDate {
                    Text("예상 소비기한 \(expirationDate.toKoreanDateString())")
                        .typography(.body2, color: .Gray._500)
                }
            }
        }
    }
}

#Preview {
    VStack {
        IngredientInfo(content: IngredientModel(name: "고구마", category: "채소", date: Date.from(year: 2024, month: 11, day: 21)))
        
        IngredientInfo(content: IngredientModel(name: "고구마", category: "채소", date: Date.from(year: 2024, month: 11, day: 21)), type: .detail, expirationDate: Date.from(year: 2024, month: 12, day: 5))
        
        IngredientInfo(content: IngredientModel(name: "고구마", category: "채소", date: Date.from(year: 2024, month: 11, day: 21)), type: .warning, warningDate: 3)
    }
}
