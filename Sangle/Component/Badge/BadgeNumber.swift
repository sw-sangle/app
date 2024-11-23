//
//  BadgeNumber.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/23/24.
//

import SwiftUI

extension Badge {
    struct Number: View {
        let number: Int
        
        var body: some View {
            Text("\(number)")
                .typography(.subtitle2Emphasized, color: .Color.white)
                .frame(width: 36, height: 36)
                .background(Color.Color.green)
                .clipShape(Circle())
        }
    }
}

#Preview {
    Badge.Number(number: 1)
}
