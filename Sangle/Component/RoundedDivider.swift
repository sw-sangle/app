//
//  RoundedDivider.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/22/24.
//

import SwiftUI

struct RoundedDivider: View {
    let height: CGFloat
    let color: Color
    
    init(height: CGFloat = 1, color: Color = .gray.opacity(0.2)) {
        self.height = height
        self.color = color
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: height / 2)
            .fill(color)
            .frame(height: height)
    }
}
