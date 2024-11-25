//
//  ResultScreen.swift
//  Sangle
//
//  Created by 김태영 on 11/24/24.
//

import SwiftUI

struct ScanResultScreen: View {
    @Binding var path: NavigationPath
    
    @State private var purchaseDate: String = "20250415"
    
    @Environment(IngredientMacro.self) private var ingredientMacro
    
    var body: some View {
        VStack {
            Header(title: "바코드 스캔", action: { path.removeLast() }, type: .close)
            VStack {
                VStack(spacing: 31.5) {
                    VStack(spacing: 0) {
                        Image("Test/ggobukchip")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .clipped()
                        Text("꼬북칩 카라멜 팝콘맛")
                            .typography(.title3Emphasized)
                        
                        Text("과자")
                            .typography(.body1, color: Color.Gray._500)
                    }
                    Input.Plain(text: $purchaseDate, placeholder: "식재료 구입 날짜를 입력 해주세요", filter: { $0.isBirthString() })
                }
                Spacer()
                
                VStack {
                    TapButton(action: {
                        path.append(HomeScreenPath.ingredients)
                        
                        ingredientMacro.data.append(
                            IngredientModel(name: "꼬북칩 카라멜 팝콘맛", category: "과자", date: Date(), expirationDate: Date.from(year: 2025, month: 4, day: 15))
                        )
                    }, text: "완료", size: .large, disabled: purchaseDate.isEmpty || !purchaseDate.isBirthString(), fill: true)
                }
                .padding(.vertical, 14)
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    ScanResultScreen(path: .constant(NavigationPath([HomeScreenPath.scanResult])))
        .environment(IngredientMacro())
}
