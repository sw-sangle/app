//
//  SplashScreen.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/23/24.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            Color.Color.green
                .ignoresSafeArea()
            
            Image("Logo/default")
                .resizable()
                .frame(width: 150, height: 150)
        }
    }
}

#Preview {
    SplashScreen()
}
