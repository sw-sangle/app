//
//  Header.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/20/24.
//

import SwiftUI

enum BottomBarTab {
    case home, analysis, mypage
}

struct BottomBar : View {
    @Binding var tab: BottomBarTab
    
    var body: some View {
        HStack(spacing: 0) {
            BottomBarItem(icon: "food_bank", text: "홈", current: .home, tab: $tab)
            
            BottomBarItem(icon: "bar_chart", text: "소비 분석", current: .analysis, tab: $tab)
            
            BottomBarItem(icon: "person", text: "마이페이지", current: .mypage, tab: $tab)
        }
        .padding(.vertical, 4)
    }
}

struct BottomBarItem: View {
    let icon: String
    let text: String
    
    let current: BottomBarTab
    @Binding var tab: BottomBarTab
    
    var isCurrent: Bool {
        return tab == current
    }
    
    var body: some View {
        Button(action: {
            tab = current
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
        BottomBar(tab: .constant(.home))
    }
}
