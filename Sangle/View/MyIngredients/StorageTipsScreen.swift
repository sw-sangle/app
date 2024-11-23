//
//  StorageTipsScreen.swift
//  Sangle
//
//  Created by 김태영 on 11/23/24.
//

import SwiftUI

struct StorageTipsScreen: View {
    @Binding var homeScreenPath: NavigationPath
    
    var body: some View {
        VStack {
            Header(title: "보관 팁", action: { homeScreenPath.removeLast() }, type: .back)
            ScrollView(.vertical) {
                
            }
        }
    }
}

#Preview {
    StorageTipsScreen(homeScreenPath: .constant(NavigationPath([MyIngredientsScreenScreenPath.tips])))
}
