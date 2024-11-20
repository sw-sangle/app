//
//  Button.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/20/24.
//

import SwiftUI

enum TapButtonType {
    case primary, secondary
}

enum TapButtonSize {
    case small, large
}

struct TapButton: View {
    let action: () -> Void
    let text: String
    let type: TapButtonType
    let size: TapButtonSize
    let disabled: Bool
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .typography(
                    size == .small ? .body2Emphasized : .subtitle2Emphasized, color: disabled ? Color(hex: "3C3C43", alpha: 0.3) : .Color.white
                )
                .padding(
                    .horizontal,
                    size == .small ? 18 : 28
                )
                .padding(
                    .vertical,
                    size == .small ? 8 : 14
                )
                .background(disabled ? Color(hex: "D6D6D7") : (type == .primary ? .Color.green : Color(hex: "0ABD4B", alpha: 0.55)))
                .clipShape(RoundedRectangle(cornerRadius: size == .small ? 12 : 16))
        }
        .disabled(disabled)
    }
}

#Preview {
    TapButton(action: {}, text: "Test", type: .primary, size: .large, disabled: true)
}
