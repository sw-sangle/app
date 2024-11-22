//
//  HomeScreen.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/22/24.
//

import SwiftUI

struct MyPageScreen: View {
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
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
}
