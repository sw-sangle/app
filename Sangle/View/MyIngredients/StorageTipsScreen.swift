//
//  StorageTipsScreen.swift
//  Sangle
//
//  Created by 김태영 on 11/23/24.
//

import SwiftUI

struct StorageTipsScreen: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            Header(title: "보관 팁", action: { path.removeLast() }, type: .back)
            ScrollView(.vertical) {
                
            }
        }
    }
}

#Preview {
    StorageTipsScreen(path: .constant(NavigationPath([HomeScreenPath.storageTips])))
}
