//
//  Login.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/23/24.
//

import SwiftUI

struct Auth: View {
    @State var phoneNumber: String = ""
    @State var code: String = ""
    
    @State var submittedPhoneNumber: String = ""
    
    @State var codeDisabled: Bool = true
    
    @Environment(AuthMacro.self) private var authMacro
    
    @State var showSignup: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    Rectangle()
                        .fill(.clear)
                        .frame(height: 54)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("전화번호 인증을 진행해주세요")
                            .typography(.title3Emphasized, color: .Color.black )
                        
                        Text("아래 정보들을 입력 해주세요")
                            .typography(.body1, color: .Gray._500 )
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 14)
                    
                    VStack(spacing: 14) {
                        Input.Plain(text: $phoneNumber, placeholder: "전화번호를 입력해주세요", filter: { $0.isValidPhoneNumber() }, keyboardType: .numberPad)
                            .onChange(of: phoneNumber) { oldValue, newValue in
                                
                                if oldValue != newValue {
                                    codeDisabled = true
                                }
                            }
                        
                        HStack(spacing: 12) {
                            Input.Plain(text: $code, placeholder: "인증번호를 입력해주세요", filter: { $0.count == 6
                            }, keyboardType: .numberPad, disabled: codeDisabled)
                            
                            TapButton(action: {
                                codeDisabled = false
                                submittedPhoneNumber = phoneNumber
                                code = ""
                                
                                Task {
                                    try await AuthService.verifySms(phoneNumber)
                                }
                            }, text: "인증", size: .large, disabled: !phoneNumber.isValidPhoneNumber() || submittedPhoneNumber == phoneNumber)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 14)
                    
                    Spacer()
                    
                    Group {
                        TapButton(action: {
                            //                        authMacro.isAuthenticated = true
                            showSignup = true
                        }, text: "다음", size: .large, disabled: codeDisabled || code.count != 6, fill: true)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 14)
                }
            }
            .onAppear (perform: UIApplication.shared.hideKeyboard)
            .navigationDestination(isPresented: $showSignup) {
                Signup(showSignup: $showSignup)
                    .navigationBarBackButtonHidden()
            }
        }
    }
}

#Preview {
    Auth()
        .environment(AuthMacro())
}
