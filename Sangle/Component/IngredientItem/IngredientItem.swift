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
    let white: Bool
    let backgroundColor: Color?
    
    init(
        icon: String,
        name: String,
        category: String,
        type: IngredientItemType,
        action: @escaping () -> Void,
        white: Bool = false,
        backgroundColor: Color = Color.Gray._150
    ) {
        self.icon = icon
        self.name = name
        self.category = category
        self.type = type
        self.action = action
        self.white = white
        self.backgroundColor = backgroundColor
    }
    
    
    var body: some View {
        HStack(spacing: 6) {
            Image("3D/\(icon)")
                .resizable()
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(name)
                    .typography(.subtitle1Emphasized, color: white ? .Color.white : .Color.black)
                
                Text(category)
                    .typography(.body1, color: white ? .Gray._150 : .Gray._500)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Button(action: action) {
                Icon(type == .edit ? "Icon/edit" : "Icon/chevron_forward", size: 24, color: white ? .Gray._100 : Color(hex: "#1c1b1f"))
            }
        }
        .padding(16)
        .background(backgroundColor)
        .radius(12)
    }
}

#Preview {
    VStack {
        IngredientItem(icon: "vegetables", name: "당근", category: "채소", type: .edit, action: {})
        IngredientItem(icon: "vegetables", name: "당근", category: "채소", type: .navigate, action: {})
    }
}
