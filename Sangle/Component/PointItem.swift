//
//  PointItem.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/24/24.
//

import SwiftUI


struct PointItem: View {
    let icon: String
    let name: String
    let point: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Image(icon)
            
            HStack {
                Text(name)
                    .typography(.body1, color: .Color.black)
                
                Spacer()
                
                Text("\(point)P")
                    .typography(.body2, color: .Color.green)
            }
        }
    }
}

#Preview {
    PointItem(icon: "3D/cart", name: "리치마트", point: 40)
}
