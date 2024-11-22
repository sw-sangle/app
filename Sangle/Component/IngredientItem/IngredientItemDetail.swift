//
//  Ingredient.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/22/24.
//

import SwiftUI

struct IngredientItemDetail: View {
    let icon: String
    let title: String
    let description: String
    let content: [IngredientModel]
    
    let action: () -> Void
    
    
    var body: some View {
        VStack(spacing: 16) {
            info
            ingredientList
        }
        .padding(16)
        .background(Color.Gray._150)
        .radius(12)
    }
    
    var info: some View {
        HStack(spacing: 6) {
            Image("3D/\(icon)")
                .resizable()
                .frame(width: 48, height: 48)
            
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text(title)
                        .typography(.subtitle1Emphasized, color: .Color.black)
                    
                    Text(description)
                        .typography(.body2, color: .Gray._500)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                Button(action: action) {
                    Icon("Icon/chevron_forward", size: 24, color: Color(hex: "#1c1b1f"))
                }
            }
        }
    }
    
    var ingredientList: some View {
        VStack(spacing: 10) {
            ForEach(content.indices, id: \.self) { index in
                let item = content[index]
                
                IngredientInfo(content: item)
                
                if index != content.count - 1 {
                    RoundedDivider(color: .Gray._350)
                }
            }
        }
        .padding(14)
        .background(Color.Gray._200)
        .radius(16)
    }
}

#Preview {
    VStack {
        IngredientItemDetail(
            icon: "refrigerator",
            title: "내 식재료",
            description: "최신순으로 정렬되어있어요",
            content: [
                IngredientModel(name: "고구마", category: "채소", date: Date.from(year: 2024, month: 11, day: 21)),
                IngredientModel(name: "당근", category: "채소", date: Date.from(year: 2024, month: 11, day: 22)),
                IngredientModel(name: "시금치", category: "채소", date: Date.from(year: 2024, month: 11, day: 23)),
            ],
            action: {}
        )
    }
}
