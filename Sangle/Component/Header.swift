//
//  Header.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/20/24.
//

import SwiftUI

enum HeaderType {
    case back, close, plain, title
}

struct Header: View {
    let title: String
    let action: () -> Void
    let type: HeaderType
    
    var body: some View {
        HStack(spacing: 0) {
            if type == .back {
                Button(action: action) {
                    Icon(size: 24, name: "Icon/arrow_back", color: .Color.black)
                }
            } else {
                Rectangle()
                    .fill(.clear)
                    .frame(width: 24, height: 24)
            }
            
            if type != .title {
                Spacer()
            }
            
            Text(title)
                .typography(type == .title ? .title1 : .subtitle1Emphasized, color: .Color.black)
            
            Spacer()
            
            if type == .close {
                Button(action: action) {
                    Icon(size: 24, name: "Icon/close", color: .Color.black)
                }
            } else {
                Rectangle()
                    .fill(.clear)
                    .frame(width: 24, height: 24)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 14)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    VStack {
        Header(title: "Text", action: {}, type: .close)
        Header(title: "Text", action: {}, type: .back)
        Header(title: "Text", action: {}, type: .plain)
        Header(title: "Text", action: {}, type: .title)
    }
}
