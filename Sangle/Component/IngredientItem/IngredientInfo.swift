//
//  Ingredient.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/22/24.
//

import SwiftUI

struct IngredientInfo: View {
    let content: IngredientModel
    let detail: Bool
    let expirationDate: Date?
   
    init(content: IngredientModel, detail: Bool = false, expirationDate: Date? = nil) {
        self.content = content
        self.detail = detail
        self.expirationDate = expirationDate
    }
    
    var body: some View {
        if !detail {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 0) {
                    Text(content.name)
                        .typography(.body1, color: .Color.black)
                    
                    Text(content.category)
                        .typography(.body2, color: .Gray._500)
                }
                
                Spacer()
                
                Text(content.date.toKoreanDateString())
                    .typography(.body2, color: .Gray._500)
            }
        } else {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(content.date.toKoreanDateString())
                        .typography(.body2Emphasized, color: .Gray._500)
                    
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
        
        IngredientInfo(content: IngredientModel(name: "고구마", category: "채소", date: Date.from(year: 2024, month: 11, day: 21)), detail: true, expirationDate: Date.from(year: 2024, month: 12, day: 5))
    }
}
