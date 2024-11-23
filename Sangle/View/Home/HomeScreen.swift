//
//  HomeScreen.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/22/24.
//

import SwiftUI

struct HomeScreen: View {
    @State private var path = NavigationPath()
    
    @State private var showIngredientsAdditionAlert: Bool = true
    @State private var showExpirationDateAlert: Bool = true
    @State private var showMyIngredients: Bool = true
    @State private var showMenuRecommendation: Bool = true
    
    @State private var expirationDateModel: [IngredientModel] = [
        IngredientModel(name: "고구마", category: "채소"),
        IngredientModel(name: "고구마", category: "채소"),
        IngredientModel(name: "고구마", category: "채소")
    ]
    
    var body: some View {
        NavigationStack(path: $path) {
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
    
    var menuRecommendation: some View {
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
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image("Test/carrot_fried_rice")
               .resizable()
               .aspectRatio(contentMode: .fill)
               .frame(height: 200)
               .clipped()
               .radius(12)
            
            TapButton(action: {}, text: "바로가기", type: .primary, size: .large, disabled: false, fill: true)
        }
        .padding(16)
        .background(Color.Gray._150)
        .radius(12)
    }
}

#Preview {
    HomeScreen()
}