//
//  Plain.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/23/24.
//

import SwiftUI

extension Input {
    struct Plain: View {
        @Binding var text: String
        let placeholder: String
        let filter: (String) -> Bool
        let keyboardType: UIKeyboardType
        let disabled: Bool
        
        init(text: Binding<String>, placeholder: String, filter: @escaping (String) -> Bool, keyboardType: UIKeyboardType = .default, disabled: Bool = false) {
           self._text = text
           self.placeholder = placeholder
           self.filter = filter
           self.keyboardType = keyboardType
            self.disabled = disabled
        }
       
       @FocusState var isFocused: Bool
        
        var body: some View {
            HStack(spacing: 16) {
                TextField("", text: $text)
                    .keyboardType(keyboardType)
                    .disabled(disabled)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .placeholder(when: text.isEmpty) {
                        Text(placeholder).typography(.body1, color: disabled ? .Gray._250 : .Gray._500)
                    }
                    .focused($isFocused)
                    .typography(.body1, color: .Color.black)
                    .tint(.Color.green)
                
                Group {
                    if text.isEmpty {
                        Rectangle()
                            .fill(.clear)
                            .frame(width: 24, height: 24)
                    } else if !isFocused {
                        Icon(filter(text) ? "Icon/check_circle" :   "Icon/cancel", size: 24,
                             color: filter(text) ? .Color.green : .Color.red)
                    } else {
                        Button(action: {
                            text = ""
                        }) {
                            Icon("Icon/close", size: 24, color: .Color.black)
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
        }
    }
}

#Preview {
    @Previewable @State var text: String = ""
    
    Input.Plain(text: $text, placeholder: "Placeholder", filter: { $0.contains("s")}, disabled: true)
}
