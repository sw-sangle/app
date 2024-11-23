//
//  MyIngredients.swift
//  Sangle
//
//  Created by 김태영 on 11/23/24.
//

import SwiftUI

enum MyIngredientsScreenScreenPath {
    case scan, tips
}

enum FilterMode {
    case recent, older
}

struct MyIngredientsScreen: View {
    @Binding var homeScreenPath: NavigationPath
    
    @State private var path = NavigationPath()
    @State var filterMode: FilterMode = .recent
    
    private let ingredientsCount: Int = 4
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                VStack {
                    Header(title: "내 식재료", action: { homeScreenPath.removeLast() }, type: .back)
                    ZStack {
                        ScrollView(.vertical) {
                            HStack(spacing: 12) {
                                filter
                                storageTips
                            }
                            .padding(.horizontal, 20)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            
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
                        
                        scanFAB
                    }
                }
            }
            .navigationDestination(for: MyIngredientsScreenScreenPath.self) { screenPath in
                switch screenPath {
                    case .scan:
                        BarcodeScanScreen(homeScreenPath: $path)
                            .navigationBarBackButtonHidden()
                    case .tips:
                        StorageTipsScreen(homeScreenPath: $path)
                            .navigationBarBackButtonHidden()
                }
            }
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
            .padding(.leading, 20)
        }
    }
    
    var storageTips: some View {
        TapButton(action: { path.append(MyIngredientsScreenScreenPath.tips) }, text: "보관 팁", size: .small, disabled: false)
    }
    
    var scanFAB: some View {
        VStack() {
            NavigationLink(value: MyIngredientsScreenScreenPath.scan) {
                Badge.Icon(name: "document_scanner")
            }
        }
        .padding(.trailing)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
    }
}

#Preview {
    MyIngredientsScreen(homeScreenPath: .constant(NavigationPath([HomeScreenPath.ingredients])))
}
