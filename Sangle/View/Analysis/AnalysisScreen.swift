//
//  HomeScreen.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/22/24.
//

import SwiftUI

struct AnalysisScreen: View {
    @Environment(BottomBarMacro.self) private var bottomBarMacro
    
    @State var showIgnoreRecentProductsAlert: Bool = true
    
    var body: some View {
        @Bindable var bottomBarBindable = bottomBarMacro
        
        NavigationStack(path: $bottomBarBindable.analysisPath) {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    Header(title: "소비 분석", type: .title)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 21) {
                            if (showIgnoreRecentProductsAlert) {
                                ignoreRecentProductsAlert
                            }
                            
                            foodPurchaseSuggestions
                            
                            AnalysisMonthlyGraph(
                                title: "버려지지 않은 식재료",
                                chartData: [
                                    ChartData(
                                        month: 8,
                                        value: 70,
                                        ingredientsCount: 10
                                    ),
                                    ChartData(
                                        month: 9,
                                        value: 35,
                                        ingredientsCount: 10
                                    ),
                                    ChartData(
                                        month: 10,
                                        value: 80,
                                        ingredientsCount: 10
                                    ),
                                    ChartData(
                                        month: 11,
                                        value: 50,
                                        ingredientsCount: 10
                                    ),
                                ],
                                chartColor: Color.Color.green
                            )
                            
                            AnalysisMonthlyGraph(
                                title: "버려진 식재료",
                                chartData: [
                                    ChartData(
                                        month: 8,
                                        value: 20,
                                        ingredientsCount: 10
                                    ),
                                    ChartData(
                                        month: 9,
                                        value: 20,
                                        ingredientsCount: 10
                                    ),
                                    ChartData(
                                        month: 10,
                                        value: 20,
                                        ingredientsCount: 10
                                    ),
                                    ChartData(
                                        month: 11,
                                        value: 20,
                                        ingredientsCount: 10
                                    ),
                                ],
                                chartColor: Color.Gray._300
                            )
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
    
    var ignoreRecentProductsAlert: some View {
        HStack {
            VStack(spacing: 0) {
                Text("이번엔 정말 풍성하게 구매하셨네요!")
                    .typography(.body1Emphasized)
                Text("평소 소비 분석에는 제외할 수 있습니다.")
                    .typography(.body2, color: Color.Gray._500)
            }
            Spacer()
            TapButton(action: {}, text: "제외하기", size: .small, disabled: false)
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(Color.Gray._150)
        .cornerRadius(12)
    }
    
    var foodPurchaseSuggestions: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("식품 구입 제안")
                .typography(.body1Emphasized)
            VStack(spacing: 8) {
                FoodPurchaseSuggestionsItem(name: "당근", category: "채소", count: -10)
                RoundedDivider()
                FoodPurchaseSuggestionsItem(name: "당근", category: "채소", count: 5)
                
            }
            .padding(14)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .background(Color.Gray._200)
            .cornerRadius(16)
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.Gray._150)
        .cornerRadius(12)
    }
}

struct FoodPurchaseSuggestionsItem: View {
    let name: String
    let category: String
    let count: Int
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(spacing: 0) {
                Text(name)
                    .typography(.body1)
                Text(category)
                    .typography(.body2, color: Color.Gray._500)
            }
            Spacer()
            Text("\(count < 0 ? count * -1 : count)개")
                .typography(.body2, color: count < 0 ? Color.red : Color.Color.green)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    AnalysisScreen()
        .environment(BottomBarMacro())
}
