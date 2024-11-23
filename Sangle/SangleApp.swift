//
//  SangleApp.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/20/24.
//

import SwiftUI

@main
struct SangleApp: App {
    @State var showSplashScreen: Bool = true
    
    @State private var bottomBarMacro = BottomBarMacro()
    @State private var authMacro = AuthMacro()
    
    var body: some Scene {
        WindowGroup {
            if showSplashScreen {
                SplashScreen()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            withAnimation {
                                showSplashScreen = false
                            }
                        }
                    }
            } else {
                ContentView()
                    .environment(bottomBarMacro)
                    .environment(authMacro)
            }
        }
    }
}
