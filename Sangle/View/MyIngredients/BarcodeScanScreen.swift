//
//  BarcodeScan.swift
//  Sangle
//
//  Created by 김태영 on 11/23/24.
//

import SwiftUI

struct BarcodeScanScreen: View {
    @Binding var path: NavigationPath
    
    @State var scannedCode: String = ""
    
    var body: some View {
        VStack {
            ZStack {
                BarcodeScannerPreview(scannedCode: $scannedCode)
                close
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onChange(of: scannedCode) { _, newValue in
            if newValue.count == 13 {
                path.append(HomeScreenPath.scanResult)
            }
        }
        .onAppear { scannedCode = "" }
    }
    
    var close: some View {
        VStack {
            Button(action: { path.removeLast() }) {
                Icon("Icon/close", size: 24)
            }
            .frame(width: 50, height: 50, alignment: .center)
            .background(.white)
            .cornerRadius(1000)
            .shadow(color: .black.opacity(0.25), radius: 16, x: 0, y: 4)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    }
}

#Preview {
    BarcodeScanScreen(path: .constant(NavigationPath([HomeScreenPath.barcodeScan])))
}
