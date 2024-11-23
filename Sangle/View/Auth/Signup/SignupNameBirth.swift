//
//  SignupNameBirth.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/23/24.
//

import SwiftUI

extension Signup {
    struct NameBirth: View {
        @Binding var name: String
        @Binding var birth: String
        
        var body: some View {
            VStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("전화번호 인증을 진행해주세요")
                        .typography(.title3Emphasized, color: .Color.black )
                    
                    Text("아래 정보들을 입력 해주세요")
                        .typography(.body1, color: .Gray._500 )
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.vertical, 14)
                
                VStack(spacing: 14) {
                    Input.Plain(text: $name, placeholder: "이름을 입력해주세요", filter: { text in
                        return true
                    })
                    
                    Input.Plain(
                        text: $birth,
                        placeholder: "생년월일 8자리를 입력해주세요",
                        filter: { $0.removeCharacter(".").isBirthString() }
                    )
                    .onChange(of: birth) { oldValue, newValue in
                        birth = newValue.addDotToBirth()
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 14)
            }
        }
    }
}

#Preview {
    Signup.NameBirth(name: .constant(""), birth: .constant(""))
}
