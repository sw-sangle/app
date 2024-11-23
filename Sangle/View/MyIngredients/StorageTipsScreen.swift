//
//  StorageTipsScreen.swift
//  Sangle
//
//  Created by 김태영 on 11/23/24.
//

import SwiftUI

struct StorageTipsCard: View {
    let image: String
    let title: String
    let description: String
    let path: StorageTipsPath
    
    var body: some View {
        NavigationLink(value: path) {
            VStack(spacing: 0) {
                Image(image)
                    .resizable()
                    .frame(width: 100, height: 100)
                
                Text(title)
                    .typography(.subtitle1Emphasized, color: .Color.black)
                
                Text(description)
                    .typography(.body2, color: .Gray._500)
            }
            .padding(.vertical, 24)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.line, lineWidth: 1)
            )
        }
    }
}

struct StorageTipsScreen: View {
    @Binding var path: NavigationPath
    
    let tips = [
        (path: StorageTipsPath.fruits, image: "3D/peach_big", title: "과일 보관하는 팁", description: "과일을 보관 하는 꿀팁을 알려 드릴게요."),
        (path: StorageTipsPath.vegetables, image: "3D/vegetables_big", title: "채소 보관하는 팁", description: "채소를 보관 하는 꿀팁을 알려 드릴게요."),
        (path: StorageTipsPath.meats, image: "3D/meat_big", title: "육류 보관하는 팁", description: "육류를 보관 하는 꿀팁을 알려 드릴게요.")
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            Header(title: "보관 팁", action: { path.removeLast() }, type: .back)
            
            VStack(spacing: 16) {
                ForEach(tips, id: \.title) { tip in
                    StorageTipsCard(
                        image: tip.image,
                        title: tip.title,
                        description: tip.description,
                        path: tip.path
                    )
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 14)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    StorageTipsScreen(path: .constant(NavigationPath([HomeScreenPath.storageTips])))
}
