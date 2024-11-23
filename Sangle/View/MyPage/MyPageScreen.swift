//
//  HomeScreen.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/22/24.
//

import SwiftUI

struct MyPageScreen: View {
    @Environment(BottomBarMacro.self) private var bottomBarMacro
    @Environment(AuthMacro.self) private var authMacro
    
    var body: some View {
        @Bindable var bottomBarBindable = bottomBarMacro
        
        NavigationStack(path: $bottomBarBindable.mypagePath) {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    Header(title: "마이페이지", type: .title)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        if let me = authMacro.me {
                            Text("\(me.name)님 환영합니다!")
                                .typography(.subtitle2Emphasized, color: .Color.black)
                            
                            Text("\(String(me.birthDateYear)).\(me.birthDateMonth.addZeroPadding()).\(me.birthDateDay.addZeroPadding())")
                                .typography(.subtitle2, color: .Gray._500)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(20)
                    
                    VStack {
                        VStack(spacing: 16) {
                            HStack(spacing: 6) {
                                Image("3D/coin")
                                    .resizable()
                                    .frame(width: 48, height: 48)
                                
                                Text("쌓인 포인트 확인하기")
                                    .typography(.subtitle2Emphasized, color: .Color.black)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack(spacing: 12) {
                                PointItem(icon: "3D/cart", name: "리치마트", point: 40)
                                
                                RoundedDivider(height: 1, color: .Gray._350)
                                
                                PointItem(icon: "Test/homeplus", name: "홈플러스", point: 140)
                                
                                RoundedDivider(height: 1, color: .Gray._350)
                                
                                PointItem(icon: "Test/lotte_mart", name: "롯데마트", point: 140)
                                
                                RoundedDivider(height: 1, color: .Gray._350)
                                
                                PointItem(icon: "Test/traders", name: "리치마트", point: 140)
                            }
                            .padding(14)
                        }
                        .padding(16)
                        .background(Color.Gray._150)
                        .radius(12)
                    }
                    .padding(20)
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    MyPageScreen()
        .environment(BottomBarMacro())
        .environment(AuthMacro())
}
