//
//  HomeScreen.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/22/24.
//

import SwiftUI

enum HomeScreenPath {
    case search, ingredients, storageTips, barcodeScan, scanResult, recipe, recipeDetail
}

enum StorageTipsPath {
    case fruits, vegetables, meats
}

struct HomeScreen: View {
    @State private var showIngredientsAdditionAlert: Bool = true
    @State private var showExpirationDateAlert: Bool = true
    @State private var showMyIngredients: Bool = true
    @State private var showMenuRecommendation: Bool = true
    
    @Environment(BottomBarMacro.self) private var bottomBarMacro
    
    @State private var expirationDateModel: [IngredientModel] = [
        IngredientModel(name: "고구마", category: "채소"),
        IngredientModel(name: "고구마", category: "채소"),
        IngredientModel(name: "고구마", category: "채소")
    ]
    
    var body: some View {
        @Bindable var bottomBarBindable = bottomBarMacro
        
        NavigationStack(path: $bottomBarBindable.homePath) {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    Header(title: "홈", type: .title)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 14) {
                            if showIngredientsAdditionAlert {
                                ingredientsAdditionAlert
                            }
                            
                            if showExpirationDateAlert {
                                expirationDateAlert
                            }
                            
                            if showMyIngredients {
                                myIngredients
                            }
                            
                            if showMenuRecommendation {
                                menuRecommendation
                            }
                        }
                        .padding(.bottom, 60)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 14)
                }
                
                Spacer()
            }
            .navigationDestination(for: HomeScreenPath.self) { home in
                switch home {
                case .search:
                    RecipeSearchScreen(path: $bottomBarBindable.homePath)
                        .navigationBarBackButtonHidden()
                case .ingredients:
                    MyIngredientsScreen(path: $bottomBarBindable.homePath)
                        .navigationBarBackButtonHidden()
                case .barcodeScan:
                    BarcodeScanScreen(path: $bottomBarBindable.homePath)
                        .navigationBarBackButtonHidden()
                case .storageTips:
                    StorageTipsScreen(path: $bottomBarBindable.homePath)
                        .navigationBarBackButtonHidden()
                case .scanResult:
                    ScanResultScreen(path: $bottomBarBindable.homePath)
                        .navigationBarBackButtonHidden()
                case .recipe:
                    RecipeSearchScreen(path: $bottomBarBindable.homePath)
                        .navigationBarBackButtonHidden()
                case .recipeDetail:
                    RecipeDetailScreen(path: $bottomBarBindable.homePath)
                        .navigationBarBackButtonHidden()
                }
            }
            .navigationDestination(for: StorageTipsPath.self) { storageTips in
                StorageTipsSearchScreen(path: $bottomBarBindable.homePath, type: storageTips)
            }
        }
    }
    
    var ingredientsAdditionAlert: some View {
        IngredientItem(icon: "vegetables", name: "식재료를 추가해주세요", category: "소비기한을 알려드릴게요!", type: .navigate, action: {}, white: true, backgroundColor: .Color.green)
    }
    
    var expirationDateAlert: some View {
        VStack(spacing: 16) {
            HStack(spacing: 6) {
                Image("3D/clock")
                    .resizable()
                    .frame(width: 48, height: 48)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("소비기한이 얼마 남지 않았어요!")
                        .typography(.subtitle2Emphasized, color: .Color.black)
                    
                    Text("음식이 상할 수 있어요")
                        .typography(.body2, color: .Gray._500)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 10) {
                ForEach(expirationDateModel.indices, id: \.self) { index in
                    let item = expirationDateModel[index]
                    
                    IngredientInfo(content: item, type: .warning, warningDate: (index + 1) * 2 + 1)
                }
            }
            .padding(14)
            .background(
               RoundedRectangle(cornerRadius: 12)
                   .stroke(Color.Color.red, lineWidth: 1)
            )
        }
        .padding(16)
        .background(Color.Gray._150)
        .radius(12)
    }
    
    var myIngredients: some View {
        NavigationLink(value: HomeScreenPath.ingredients) {
            IngredientItemDetail(
                icon: "refrigerator",
                title: "내 식재료",
                description: "최신순으로 정렬되어있어요",
                content: [
                    IngredientModel(name: "고구마", category: "채소", date: Date.from(year: 2024, month: 11, day: 21)),
                    IngredientModel(name: "당근", category: "채소", date: Date.from(year: 2024, month: 11, day: 22)),
                    IngredientModel(name: "시금치", category: "채소", date: Date.from(year: 2024, month: 11, day: 23)),
                ]

            )
        }
    }
    
    var menuRecommendation: some View {
        VStack(spacing: 24) {
            NavigationLink(value: HomeScreenPath.search) {
                VStack(spacing: 24) {
                    HStack(spacing: 6) {
                        Image("3D/frying_pan")
                            .resizable()
                            .frame(width: 48, height: 48)
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text("당근볶음밥")
                                .typography(.subtitle1Emphasized, color: .Color.black)
                            
                            Text("오늘의 요리는 이 메뉴 어때요?")
                                .typography(.body2, color: .Gray._500)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Icon("Icon/arrow_forward", size: 24, color: Color(hex: "#1C1B1F"))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Image("Test/carrot_fried_rice")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
                        .radius(12)
                }
            }
            
            TapButton(action: {}, text: "바로가기", size: .large, disabled: false, fill: true)
        }
        .padding(16)
        .background(Color.Gray._150)
        .radius(12)
    }
}

#Preview {
    HomeScreen()
        .environment(BottomBarMacro())
}
