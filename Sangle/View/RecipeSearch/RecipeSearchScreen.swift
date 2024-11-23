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
    @State var showResult: Bool = false
    @FocusState var isSearching: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            titleBar
            
            VStack {
                if (!isSearching && !showResult) { recipeList }
                if (showResult) { noResult }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
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
                .focused($isSearching)
                .onChange(of: keyword) { _, newQuery in
                    if (keyword.count > 0) {
                        if (!showResult) {
                            showResult = isSearching
                        }
                    } else {
                        showResult = !isSearching
                    }
                }
            
            Button(action: {}) {
                Icon("Icon/search", size: 24, color: Color(hex: "#1C1B1F"))
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 14)
    }
    
    var recipeList: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 16) {
                ForEach(1...10, id: \.self) { _ in
                    RecipeItem(
                        model: RecipeItemModel(
                            title: "당근 볶음밥 맛있게 만들기",
                            category: "채소",
                            difficulty: 1,
                            image: "https://picsum.photos/200"
                        ),
                        action: { path.append(HomeScreenPath.recipeDetail) }
                    )
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 60)
        }
    }
    
    var noResult: some View {
        VStack {
            Image("3D/surprise_big")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipped()
            Text("검색 결과를 찾지 못 했어요...")
                .typography(.subtitle2, color: Color.Gray._500)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

#Preview {
   RecipeSearchScreen(path: .constant(NavigationPath([HomeScreenPath.search])))
}
