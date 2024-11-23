//
//  StorageTipsScreen.swift
//  Sangle
//
//  Created by 김태영 on 11/23/24.
//

import SwiftUI

struct StorageTipsScreen: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            Header(title: "보관 팁", action: { path.removeLast() }, type: .back)
            
            VStack(spacing: 16) {
                VStack(spacing: 0) {
                    Image("3D/peach_big")
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    Text("과일 보관하는 팁")
                        .typography(.subtitle1Emphasized, color: .Color.black)
                    
                    Text("과일을 보관 하는 꿀팁을 알려 드릴게요.")
                        .typography(.body2, color: .Gray._500)
                }
                .padding(.vertical, 24)
                .frame(maxWidth: .infinity)
                .background(
                   RoundedRectangle(cornerRadius: 12)
                       .stroke(Color.line, lineWidth: 1)
                )
                
                VStack(spacing: 0) {
                    Image("3D/vegetables_big")
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    Text("채소 보관하는 팁")
                        .typography(.subtitle1Emphasized, color: .Color.black)
                    
                    Text("채소를 보관 하는 꿀팁을 알려 드릴게요.")
                        .typography(.body2, color: .Gray._500)
                }
                .padding(.vertical, 24)
                .frame(maxWidth: .infinity)
                .background(
                   RoundedRectangle(cornerRadius: 12)
                       .stroke(Color.line, lineWidth: 1)
                )
                
                VStack(spacing: 0) {
                    Image("3D/meat_big")
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    Text("육류 보관하는 팁")
                        .typography(.subtitle1Emphasized, color: .Color.black)
                    
                    Text("육류를 보관 하는 꿀팁을 알려 드릴게요.")
                        .typography(.body2, color: .Gray._500)
                }
                .padding(.vertical, 24)
                .frame(maxWidth: .infinity)
                .background(
                   RoundedRectangle(cornerRadius: 12)
                       .stroke(Color.line, lineWidth: 1)
                )
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 14)
        }
    }
}

#Preview {
    StorageTipsScreen(path: .constant(NavigationPath([HomeScreenPath.storageTips])))
}
