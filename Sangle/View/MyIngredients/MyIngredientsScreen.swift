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
    
    @StateObject private var nfcManager = NFCSessionManager()
    
    @State var filterMode: FilterMode = .recent
    
    @State var isAdded: Bool = false
    
    private let ingredientsCount: Int = 4
    
    @Environment(IngredientMacro.self) private var ingredientMacro
    
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
                            ForEach(ingredientMacro.data.indices, id: \.self) { index in
                                let item = ingredientMacro.data[index]
                                
                                IngredientInfo(content: item, type: .detail)
                                
                                if (index < ingredientsCount) {
                                    RoundedDivider(height: 1)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                HStack(spacing: 8) {
                    scanNFC
                    scanFAB
                }
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
        TapButton(action: {
            path.append(HomeScreenPath.storageTips) }, text: "보관 팁", size: .small, disabled: false, fill: false, isGold: true)
    }
    
    var scanNFC: some View {
        VStack() {
            TapButton(action: {
                nfcManager.startNFCSession()
            }, text: "스캔", size: .small, disabled: false, isGold: true)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        .onChange(of: nfcManager.nfcMessage) { _, _ in
            if !isAdded {
                ingredientMacro.data.append(
                    IngredientModel(name: "핫식스", category: "음료", date: Date(), expirationDate: Date.from(year: 2025, month: 3, day: 2))
                )
                
                ingredientMacro.data.append(
                    IngredientModel(name: "오징어땅콩", category: "과자", date: Date(), expirationDate: Date.from(year: 2025, month: 5, day: 4))
                )
                
                isAdded = true
            }
        }
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
        .environment(IngredientMacro())
}
