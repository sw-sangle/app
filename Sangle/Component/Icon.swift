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
   
   init(_ name: String, size: CGFloat = 24, color: Color = .black) {
       self.name = name
       self.size = size
       self.color = color
   }
   
   var body: some View {
       Image(name)
           .renderingMode(.template)
           .resizable()
           .frame(width: size, height: size)
           .foregroundStyle(color)
   }
}

#Preview {
   Icon("Icon/arrow_back", size: 24, color: .black)
}
