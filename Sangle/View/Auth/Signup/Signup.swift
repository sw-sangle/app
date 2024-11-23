//
//  Signup.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/23/24.
//

import SwiftUI

struct Signup: View {
    @Binding var showSignup: Bool
    
    @State var selection: Int = 1
    
    @State var name: String = ""
    @State var birth: String = ""
    @State var household: Int = 0
    
    @Environment(AuthMacro.self) private var authMacro
    
    var isDisabled: Bool {
        if selection == 0 {
            return name.isEmpty || !birth.removeCharacter(".").isBirthString()
        } else if selection == 1 {
            return household == 0
        }
        
        return true
    }
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                Header(title: "", action: {
                    if selection == 0 {
                        showSignup = false
                    } else {
                        selection -= 1
                    }
                }, type: .back)
                
                TabView(selection: $selection) {
                   NameBirth(name: $name, birth: $birth)
                       .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                       .tag(0)
                   
                   Household(count: $household)
                       .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                       .tag(1)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .animation(.smooth(duration: 0.2), value: selection)
                .onAppear {
                    UIScrollView.appearance().isScrollEnabled = false
                }
                .onDisappear {
                    UIScrollView.appearance().isScrollEnabled = true
                }
            }
            
            Spacer()
            
            Group {
                TapButton(action: {
                    if selection < 1 {
                        selection += 1
                    } else {
                        authMacro.isAuthenticated = true
                    }
                }, text: selection == 1 ? "계정 만들기" : "다음", size: .large, disabled: isDisabled, fill: true)
            }
            .padding(.horizontal, 20) 
            .padding(.vertical, 14)
        }
    }
}

#Preview {
    Signup(showSignup: .constant(true))
        .environment(AuthMacro())
}
