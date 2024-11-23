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

struct MyIngredientsScreen: View {
    @Binding var path: NavigationPath
    
    @State var filterMode: FilterMode = .recent
    
    private let ingredientsCount: Int = 4
    
    var body: some View {
        VStack {
            Header(title: "내 식재료", action: { path = NavigationPath() }, type: .back)
            ZStack {
                ScrollView(.vertical) {
                    VStack(spacing: 0) {
                        HStack(spacing: 12) {
                            filter
                            storageTips
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        
                        VStack(spacing: 14) {
                            ForEach(1...ingredientsCount, id: \.self) { index in
                                IngredientInfo(content: IngredientModel(name: "고구마", category: "채소", date: Date.from(year: 2024, month: 11, day: 21)), type: .detail, expirationDate: Date.from(year: 2024, month: 12, day: 5))
                                if (index < ingredientsCount) {
                                    RoundedDivider(height: 1)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                scanFAB
                    .padding(.bottom, 14)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    var filter: some View {
        Button(action: {
            filterMode = filterMode == .recent ? FilterMode.older : FilterMode.recent
        }) {
            HStack(spacing: 4) {
                Icon("Icon/instant_mix", size: 24)
                Text(filterMode == .recent ? "최근순" : "오래된순")
                    .typography(.body2)
            }
            .padding(.vertical, 14)
        }
    }
    
    var storageTips: some View {
        TapButton(action: { path.append(HomeScreenPath.storageTips) }, text: "보관 팁", size: .small, disabled: false)
    }
    
    var scanFAB: some View {
        VStack() {
            NavigationLink(value: HomeScreenPath.barcodeScan) {
                Badge.Icon(name: "document_scanner")
            }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
    }
}

#Preview {
    MyIngredientsScreen(path: .constant(NavigationPath([HomeScreenPath.ingredients])))
}
