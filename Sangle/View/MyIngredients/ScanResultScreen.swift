//
//  ResultScreen.swift
//  Sangle
//
//  Created by 김태영 on 11/24/24.
//

import SwiftUI

struct ScanResultScreen: View {
    @Binding var path: NavigationPath
    
    @State private var purchaseDate: String = ""
    
    var body: some View {
        VStack {
            Header(title: "바코드 스캔", action: { path.removeLast() }, type: .close)
            VStack {
                VStack(spacing: 31.5) {
                    VStack(spacing: 0) {
                        Image("3D/vegetables_big")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 200)
                            .clipped()
                        Text("당근")
                            .typography(.title3Emphasized)
                        Text("채소")
                            .typography(.body1, color: Color.Gray._500)
                    }
                    Input.Plain(text: $purchaseDate, placeholder: "식재료 구입 날짜를 입력 해주세요", filter: { $0.isBirthString() })
                }
                Spacer()
                
                VStack {
                    TapButton(action: { path.append(HomeScreenPath.ingredients) }, text: "완료", size: .large, disabled: false, fill: true)
                }
                .padding(.vertical, 14)
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    ScanResultScreen(path: .constant(NavigationPath([HomeScreenPath.scanResult])))
}
