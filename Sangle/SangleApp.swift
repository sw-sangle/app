//
//  SangleApp.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/20/24.
//

import SwiftUI

@main
struct SangleApp: App {
    @State private var bottomBarMacro = BottomBarMacro()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(bottomBarMacro)
        }
    }
}
