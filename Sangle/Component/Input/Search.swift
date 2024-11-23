//
//  Plain.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/23/24.
//

import SwiftUI

extension Input {
    struct Search: View {
        @Binding var keyword: String
        let placeholder: String
       
       @FocusState var isFocused: Bool
        
        var body: some View {
            HStack(spacing: 16) {
                TextField("", text: $keyword)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .placeholder(when: keyword.isEmpty) {
                        Text(placeholder).typography(.body2, color: .Gray._500)
                    }
                    .focused($isFocused)
                    .typography(.body2, color: .Color.black)
                
                    .tint(.Color.green)
                
                Group {
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
            .background(Color.Gray._150)
            .radius(16)
            .animation(.smooth, value: isFocused)
        }
    }
}

#Preview {
    @Previewable @State var text: String = ""
    
    Input.Search(keyword: $text, placeholder: "레시피를 검색해보세요")
}
