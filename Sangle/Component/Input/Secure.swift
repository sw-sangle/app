//
//  Plain.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/23/24.
//

import SwiftUI

extension Input {
    struct Secure: View {
       @Binding var text: String
       let placeholder: String
       
       @State var isSecure: Bool = true
       @State private var showValidation: Bool = false  // 추가
       
       let filter: (String) -> Bool
      
       @FocusState var isFocused: Bool
       
       var body: some View {
           HStack(spacing: 16) {
               if isSecure {
                   SecureField("", text: $text)
                       .placeholder(when: text.isEmpty) {
                           Text(placeholder).typography(.body1, color: .Gray._500)
                       }
                       .focused($isFocused)
                       .typography(.body1, color: .Color.black)
                       .tint(.Color.green)
               } else {
                   TextField("", text: $text)
                       .placeholder(when: text.isEmpty) {
                           Text(placeholder).typography(.body1, color: .Gray._500)
                       }
                       .focused($isFocused)
                       .typography(.body1, color: .Color.black)
                       .tint(.Color.green)
               }
               
               HStack(spacing: 12) {
                   if isFocused && !text.isEmpty {
                       Button(action: {
                           let current = text
                           let focus = isFocused
                           withAnimation(.smooth(duration: 0.2)) {
                               isSecure.toggle()
                           }
                           
                           DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                               text = current
                               isFocused = focus
                           }
                       }) {
                           Icon(isSecure ? "Icon/visibility_off" : "Icon/visibility_on", size: 24, color: .Color.black)
                       }
                       
                       Button(action: {
                           text = ""
                           showValidation = false  // 추가
                       }) {
                           Icon("Icon/close", size: 24, color: .Color.black)
                       }
                   } else {
                       if !text.isEmpty && showValidation {  // 수정
                           Icon(filter(text) ? "Icon/check_circle" : "Icon/cancel", size: 24,
                                color: filter(text) ? .Color.green : .Color.red)
                       }
                   }
               }
           }
           .padding(16)
           .background(
              RoundedRectangle(cornerRadius: 12)
               .stroke(isFocused ?
                       Color.Color.black :
                           text.isEmpty ?
                               Color.line :
                           filter(text) ? .Color.green : .Color.red, lineWidth: 1)
           )
           .animation(.smooth, value: isFocused)
           .onChange(of: isSecure) { _, value in
               showValidation = false
               DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                   withAnimation {
                       showValidation = true
                   }
               }
           }
       }
    }
}

#Preview {
    @Previewable @State var text: String = ""
    @Previewable @State var text1: String = ""
    
    VStack {
        Input.Secure(text: $text1, placeholder: "비밀번호를 입력해주세요", filter: { $0.count == 6 })
        
        Input.Secure(text: $text, placeholder: "비밀번호를 입력해주세요", filter: { $0.count == 6 })
    }

}
