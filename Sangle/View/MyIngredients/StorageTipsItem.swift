//
//  StorageTipsItem.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/24/24.
//

import SwiftUI

struct StorageTipsItem: View {
    let model: StorageTipModel
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(model.image)
                .resizable()
                .frame(width: 48, height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 6) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(model.title)
                        .typography(.subtitle1Emphasized, color: .Color.black)
                    
                    Text(model.description)
                        .typography(.body1, color: .Gray._500)
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(model.extra, id: \.self) { extra in
                        Text("* \(extra)")
                            .typography(.body2, color: .Color.green)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(16)
        .background(Color.Gray._150)
        .radius(12)
    }
}

#Preview {
    StorageTipsItem(model: StorageTipModel(type: .fruits, image: "StorageTips/0", title: "밀봉 포장 후 냉장/냉동", description: "육류는 공기와 접촉하면 빠르게 변질되므로, \n진공 포장하거나 랩으로 밀봉하여 보관하세요.", extra: ["단기(1~2일): 냉장 보관", "장기(2일 이상): 냉동 보관"]))
}
