//
//  MyIngredients.swift
//  Sangle
//
//  Created by 김태영 on 11/23/24.
//

import SwiftUI

enum FilterMode {
    case recent, older
}

struct MyIngredients: View {
    @State var filterMode: FilterMode = .recent
    
    private let ingredientsCount: Int = 4
    
    var body: some View {
        VStack {
            Header(title: "내 식재료", type: .back)
            ScrollView(.vertical) {
                filter
                VStack(spacing: 14) {
                    ForEach(1...ingredientsCount, id: \.self) { index in
                        IngredientInfo(content: IngredientModel(name: "고구마", category: "채소", date: Date.from(year: 2024, month: 11, day: 21)), type: .detail, expirationDate: Date.from(year: 2024, month: 12, day: 5))
                        if (index < ingredientsCount) {
                            RoundedDivider(height: 1)
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
            .frame(width: .infinity, height: .infinity)
        }
    }
    
    var filter: some View {
        HStack {
            Spacer()
            
            Button(action: {
                filterMode = filterMode == .recent ? FilterMode.older : FilterMode.recent
            }) {
                HStack(spacing: 4) {
                    Icon("Icon/instant_mix", size: 24)
                    Text(filterMode == .recent ? "최근순" : "오래된순")
                        .typography(.body2)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 14)
            }
        }
    }
}

#Preview {
    MyIngredients()
}
