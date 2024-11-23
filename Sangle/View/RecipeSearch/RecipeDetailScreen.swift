//
//  RecipeDetailScreen.swift
//  Sangle
//
//  Created by 김태영 on 11/24/24.
//

import SwiftUI

struct RecipeDetailScreen: View {
    @Binding var path: NavigationPath
    
    @State var currentIndex: Int = 0
    
    var body: some View {
        VStack {
            Header(title: "레시피", action: { path.removeLast() }, type: .back)
            ScrollView(.vertical) {
                slider
                VStack(alignment: .leading, spacing: 12)  {
                    title
                }
                .padding(.horizontal, 20)
            }
        }
    }
    
    var slider: some View {
        TabView(selection: $currentIndex) {
            image.tag(0)
            image.tag(1)
            image.tag(2)
            image.tag(3)
        }
        .frame(height: 252)
        .tabViewStyle(.page)
    }
    
    var image: some View {
        Image("Test/carrot_fried_rice")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: .infinity, height: 252)
            .clipped()
    }
    
    var title: some View {
        VStack(spacing: 6) {
            VStack(alignment: .leading) {
                Text("당근 볶음밥 맛있게 만들기")
                    .typography(.subtitle1Emphasized)
                Text("당근 볶음밥,\n실패없이 만드는 당근 볶음밥 만드는 법 알려드릴게요.")
                    .typography(.body1, color: Color.Gray._500)
            }
        }
        .padding(.top, 24)
        .padding(.bottom, 14)
    }
}

#Preview {
    RecipeDetailScreen(path: .constant(NavigationPath([HomeScreenPath.recipeDetail])))
}
