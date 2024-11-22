//
//  Header.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/20/24.
//

import SwiftUI

struct BottomBar : View {
    @Bindable var macro: BottomBarMacro
    
    enum Tab {
        case home, analysis, mypage
    }
    
    var body: some View {
        HStack(spacing: 0) {
            
            BottomBarItem(icon: "food_bank", text: "홈", current: .home, macro: macro)
            
            BottomBarItem(icon: "bar_chart", text: "소비 분석", current: .analysis, macro: macro)
            
            BottomBarItem(icon: "person", text: "마이페이지", current: .mypage, macro: macro)
        }
        .padding(.vertical, 4)
        .background(Color.background)
    }
}

struct BottomBarItem: View {
    let icon: String
    let text: String
    
    let current: BottomBar.Tab
    @Bindable var macro: BottomBarMacro
    
    var isCurrent: Bool {
        return macro.tab == current
    }
    
    var body: some View {
        Button(action: {
            macro.tab = current
        }) {
            VStack {
                Icon("Icon/\(icon)", size: 24, color: isCurrent ? .Color.black : .Gray._350)
                
                Text(text)
                    .typography(.body1, color: isCurrent ? .Color.black : .Gray._350)
            }
            .frame(maxWidth: .infinity)

        }
    }
}

#Preview {
    VStack {
        BottomBar(macro: BottomBarMacro())
    }
}
