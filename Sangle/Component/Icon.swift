//
//  Icon.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/20/24.
//

import SwiftUI

struct Icon: View {
    let size: CGFloat
    let name: String
    let color: Color
    
    var body: some View {
        Image(name)
            .renderingMode(.template)
            .resizable()
            .frame(width: size, height: size)
            .foregroundStyle(color)
    }
}

#Preview {
    Icon(size: 24, name: "Icon/arrow_back", color: .black)
}
