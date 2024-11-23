//
//  RecipeDetailScreen.swift
//  Sangle
//
//  Created by 김태영 on 11/24/24.
//

import SwiftUI

struct RecipeDetailScreen: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            
        }
    }
}

#Preview {
    RecipeDetailScreen(path: .constant(NavigationPath([HomeScreenPath.recipeDetail])))
}
