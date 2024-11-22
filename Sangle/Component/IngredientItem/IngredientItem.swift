//
//  Ingredient.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/22/24.
//

import SwiftUI

enum IngredientItemType {
    case edit, navigate
}

struct IngredientItem: View {
    let icon: String
    let name: String
    let category: String
    let type: IngredientItemType
    
    let action: () -> Void
    
    
    var body: some View {
        HStack(spacing: 6) {
            Image("3D/\(icon)")
                .resizable()
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(name)
                    .typography(.subtitle1Emphasized, color: .Color.black)
                
                Text(category)
                    .typography(.body1, color: .Gray._500)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Button(action: action) {
                Icon(type == .edit ? "Icon/edit" : "Icon/chevron_forward", size: 24, color: Color(hex: "#1c1b1f"))
            }
        }
        .padding(16)
        .background(Color.Gray._150)
        .radius(12)
    }
}

#Preview {
    VStack {
        IngredientItem(icon: "vegetables", name: "당근", category: "채소", type: .edit, action: {})
        IngredientItem(icon: "vegetables", name: "당근", category: "채소", type: .navigate, action: {})
    }
}
