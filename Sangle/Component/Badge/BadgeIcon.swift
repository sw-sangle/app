//
//  BadgeNumber.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/23/24.
//

import SwiftUI

extension Badge {
    struct Icon: View {
        let name: String
        
        var body: some View {
            Image("Icon/\(name)")
                .renderingMode(.template)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundStyle(Color.Color.white)
                .frame(width: 50, height: 50)
                .background(Color.Color.green)
                .clipShape(Circle())
        }
    }
}

#Preview {
    Badge.Icon(name: "arrow_forward")
}
