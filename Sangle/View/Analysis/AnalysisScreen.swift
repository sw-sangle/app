//
//  HomeScreen.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/22/24.
//

import SwiftUI

struct AnalysisScreen: View {
    @State var path = NavigationPath()
    
    @State var text: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                VStack {
                    VStack {
                        Text("일반 Input (filter: s를 포함하는가?)")
                        Input.Plain(text: $text, placeholder: "닉네임을 입력해주세요", filter: { $0.contains("s")})
                    }
                     
                    VStack {
                        Text("비밀번호 Input (filter: 6자리인가?)")
                        Input.Secure(text: $password, placeholder: "비밀번호를 입력해주세요", filter: { $0.count == 6 })
                    }
                }
            }
        }
    }
}

#Preview {
    AnalysisScreen()
}
