//
//  ContentView.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/20/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(BottomBarMacro.self) private var bottomBarMacro
    @Environment(AuthMacro.self) private var authMacro
    
    var body: some View {
        if !authMacro.isAuthenticated {
             Auth()
        } else {
            @Bindable var bottomBarMacro = bottomBarMacro
            
            ZStack {
                TabView(selection: $bottomBarMacro.tab) {
                    Group {
                        HomeScreen()
                            .tag(BottomBar.Tab.home)
                        
                        AnalysisScreen()
                            .tag(BottomBar.Tab.analysis)
                        
                        MyPageScreen()
                            .tag(BottomBar.Tab.mypage)
                    }
                    .toolbar(.hidden, for: .tabBar)
                }
                
                if (shouldShowBottomBar) {
                    VStack {
                        Spacer()
                        BottomBar(tab: $bottomBarMacro.tab)
                    }
                }
            }
        }
    }
    
    private var shouldShowBottomBar: Bool {
       let paths = [
            bottomBarMacro.homePath,
            bottomBarMacro.analysisPath,
            bottomBarMacro.mypagePath
       ]
       return paths.allSatisfy { $0.count == 0 }
   }
}

#Preview {
    ContentView()
        .environment(BottomBarMacro())
        .environment(AuthMacro())
}
