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
    @State private var ingredientMacro = IngredientMacro()
    
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
                    .onOpenURL { url in
                        guard url.scheme! == "https" &&
                              url.host() == "sangle.apne2a.algorix.cloud",
                              let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
                              let idItem = components.queryItems?.first(where: { $0.name == "id" }),
                              let id = idItem.value else {
                            return
                        }
                        
                        ingredientMacro.data.append(
                            IngredientModel(name: "핫식스", category: "음료", date: Date(), expirationDate: Date.from(year: 2025, month: 3, day: 2))
                        )
                        
                        ingredientMacro.data.append(
                            IngredientModel(name: "오징어땅콩", category: "과자", date: Date(), expirationDate: Date.from(year: 2025, month: 5, day: 4))
                        )
                    }
                    .environment(bottomBarMacro)
                    .environment(authMacro)
                    .environment(ingredientMacro)
            }
        }
    }
}
