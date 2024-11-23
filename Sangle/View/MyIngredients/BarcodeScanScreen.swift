//
//  BarcodeScan.swift
//  Sangle
//
//  Created by 김태영 on 11/23/24.
//

import SwiftUI

struct BarcodeScanScreen: View {
    @Binding var homeScreenPath: NavigationPath
    
    @State var scannedCode: String = ""
    
    var body: some View {
        VStack {
            Header(title: "바코드 스캔", type: .plain)
            ZStack {
                BarcodeScannerPreview(scannedCode: $scannedCode)
                close
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    var close: some View {
        VStack {
            Button(action: { homeScreenPath.removeLast() }) {
                Icon("Icon/close", size: 24)
            }
            .frame(width: 50, height: 50)
            .background(.white)
            .cornerRadius(25)
            .shadow(color: .black.opacity(0.25), radius: 16, x: 0, y: 4)
        }
        .padding(.bottom)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    }
}

#Preview {
    BarcodeScanScreen(homeScreenPath: .constant(NavigationPath([MyIngredientsScreenScreenPath.scan])))
}
