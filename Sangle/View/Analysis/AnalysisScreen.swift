//
//  HomeScreen.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/22/24.
//

import SwiftUI

struct AnalysisScreen: View {
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                Text("Analysis")
                    .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    AnalysisScreen()
}
