//
//  Button.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/20/24.
//

import SwiftUI

enum TapButtonSize {
    case small, large
}

struct TapButton: View {
   let action: () -> Void
   let text: String
   let size: TapButtonSize
   let disabled: Bool
   let fill: Bool
   
   @State private var isPressed: Bool = false
   
   init(action: @escaping () -> Void, text: String, size: TapButtonSize, disabled: Bool, fill: Bool = false) {
       self.action = action
       self.text = text
       self.size = size
       self.disabled = disabled
       self.fill = fill
   }
   
   var body: some View {
       Button(action: action) {
           if fill {
               content
           } else {
               content
           }
       }
       .buttonStyle(PressableButtonStyle(disabled: disabled, size: size, fill: fill))
       .disabled(disabled)
   }
   
   var content: some View {
       Text(text)
           .typography(
               size == .small ? .body2Emphasized : .subtitle2Emphasized,
               color: disabled ? Color(hex: "3C3C43", alpha: 0.3) : .Color.white
           )
           .padding(
               .horizontal,
               size == .small ? 18 : 28
           )
           .padding(
               .vertical,
               size == .small ? 8 : 14
           )
   }
}

struct PressableButtonStyle: ButtonStyle {
    let disabled: Bool
    let size: TapButtonSize
    let fill: Bool
   
    func makeBody(configuration: Configuration) -> some View {
        if fill {
            configuration.label
                .frame(maxWidth: .infinity)
                .background(
                    disabled ? Color(hex: "D6D6D7") :
                        configuration.isPressed ? Color(hex: "#0ABD4B", alpha: 0.55) : .Color.green
                )
                .radius(size == .small ? 12 : 16)
                .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
        } else {
            configuration.label
                .background(
                    disabled ? Color(hex: "D6D6D7") :
                        configuration.isPressed ? Color(hex: "#0ABD4B", alpha: 0.55) : .Color.green
                )
                .radius(size == .small ? 12 : 16)
                .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
        }
   }
}

#Preview {
    TapButton(action: {}, text: "Test", size: .large, disabled: false, fill: true)
}
