//
//  HomeScreen.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/22/24.
//

import SwiftUI

struct AnalysisScreen: View {
    @State var path = NavigationPath()
    
    @State var showIgnoreRecentProductsAlert: Bool = true
    
    var body: some View {
        NavigationStack(path: $path) {
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
                            
                            AnalysisMonthlyGraph(chartData: [
                                ChartData(
                                    month: 8,
                                    value: 70,
                                    prev: true
                                ),
                                ChartData(
                                    month: 9,
                                    value: 35
                                ),
                                ChartData(
                                    month: 10,
                                    value: 80
                                ),
                                ChartData(
                                    month: 11,
                                    value: 50
                                ),
                            ])
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
}

#Preview {
    AnalysisScreen()
}
