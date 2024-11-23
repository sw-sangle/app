//
//  BottomBarViewModel.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/22/24.
//

import SwiftUI
import Observation


@Observable
class BottomBarMacro {
    var tab: BottomBar.Tab = .home
    
    var homePath: NavigationPath = NavigationPath()
    var analysisPath: NavigationPath = NavigationPath()
    var mypagePath: NavigationPath = NavigationPath()
}
