//
//  RecipeSearchScreen.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/23/24.
//

import SwiftUI

struct RecipeSearchScreen: View {
    @State var keyword: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            titleBar
        }
    }
    
    var titleBar: some View {
        HStack(spacing: 14) {
            Button(action: {}) {
                Icon("Icon/arrow_backward", size: 24, color: .Color.black)
            }
            
            Input.Search(keyword: $keyword, placeholder: "레시피를 검색해보세요")
            
            Button(action: {}) {
                Icon("Icon/search", size: 24, color: Color(hex: "#1C1B1F"))
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 14)
    }
}

#Preview {
    RecipeSearchScreen()
}
