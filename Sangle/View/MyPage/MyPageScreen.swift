//
//  HomeScreen.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/22/24.
//

import SwiftUI

struct MyPageScreen: View {
    @Environment(BottomBarMacro.self) private var bottomBarMacro
    
    var body: some View {
        @Bindable var bottomBarBindable = bottomBarMacro
        
        NavigationStack(path: $bottomBarBindable.mypagePath) {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                Text("MyPage")
                    .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    MyPageScreen()
        .environment(BottomBarMacro())
}
