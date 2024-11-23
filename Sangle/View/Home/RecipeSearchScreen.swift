//
//  RecipeSearchScreen.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/23/24.
//

import SwiftUI

struct RecipeSearchScreen: View {
    @Binding var path: NavigationPath
    
    @State var keyword: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            titleBar
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 16) {
                    ForEach(1...10, id: \.self) { _ in
                        RecipeItem(
                            model: RecipeItemModel(
                                title: "당근 볶음밥 맛있게 만들기",
                                category: "채소",
                                difficulty: 1,
                                image: "https://picsum.photos/200"
                            )
                        )
                    }
                }
                .padding(.bottom, 60)
            }
        }
        .onAppear(perform: UIApplication.shared.hideKeyboard)
    }
     
    var titleBar: some View {
        HStack(spacing: 14) {
            Button(action: {
                path.removeLast()
            }) {
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
   RecipeSearchScreen(path: .constant(NavigationPath([HomeScreenPath.search])))
}
