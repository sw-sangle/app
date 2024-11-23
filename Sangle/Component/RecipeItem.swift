//
//  RecipeItem.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/23/24.
//

import SwiftUI

struct RecipeItemModel: Identifiable  {
    let id = UUID()
    let title: String
    let category: String
    let difficulty: Int
    let image: String
}

let difficultyLevels: [String] = ["입문", "초급", "중급", "어려움", "고급"]

struct RecipeItem: View {
    let model: RecipeItemModel
    let action: () -> Void
    
    var difficulty: String {
        return difficultyLevels[model.difficulty - 1]
    }
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                VStack(alignment: .leading) {
                    Text(model.title)
                        .typography(.subtitle2Emphasized, color: .Color.black)
                    
                    Text(model.category)
                        .typography(.body1, color: Color(hex: "#7C7C7C"))
                }
                
                Spacer()
                
                Image.Async(string: model.image, width: 48, height: 48, radius: 6)
            }
            
            VStack {
                HStack(spacing: 4) {
                    Text(difficulty)
                        .typography(.body1, color: .Gray._500)
                    
                    HStack(spacing: 0) {
                        ForEach(1...5, id: \.self) { star in
                            if model.difficulty >= star {
                                Icon("Icon/star_rate", size: 24, color: .Color.gold)
                            } else {
                                Icon("Icon/star", size: 24, color: .Gray._300)
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 15)
            .background(Color.Gray._200)
            .radius(12)
            
            TapButton(action: action, text: "만들어 보기", size: .large, disabled: false, fill: true)
        }
        .padding(16)
        .background(Color.Gray._150)
        .radius(12)
    }
}

#Preview {
    RecipeItem(
        model: RecipeItemModel(
            title: "당근 볶음밥 맛있게 만들기",
            category: "채소",
            difficulty: 1,
            image: "https://www.sempio.com/image/GK/MQ/20190717175948528e8b1d108-3c05-4694-8a35-0df455df579f.jpg"
        ),
        action: {}
    )
}
