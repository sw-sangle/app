//
//  SignupNameBirth.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/23/24.
//

import SwiftUI

extension Signup {
    struct Household: View {
        @Binding var count: Int
        
        // 버튼 컴포넌트 분리
        private struct HouseholdButton: View {
            let type: Int
            let isSelected: Bool
            let action: () -> Void
            
            var body: some View {
                Button(action: action) {
                    VStack(spacing: 0) {
                        Image("3D/\(type == 1 ? "person" : "people")")
                        
                        Text(type == 1 ? "1인 가구" : "다인 가구")
                            .typography(.subtitle2Emphasized, color: .Color.black)
                    }
                    .padding(.horizontal, 36)
                    .padding(.vertical, 28)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(isSelected ? Color.Color.green : Color.line, lineWidth: 1)
                            .background(isSelected ? Color.Color.green.opacity(0.1) : .clear)
                    )
                }
            }
        }
        
        var body: some View {
            VStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("가구의 수를 선택해주세요")
                        .typography(.title3Emphasized, color: .Color.black)
                    
                    Text("아래 정보들을 입력 해주세요 \(count)")
                        .typography(.body1, color: .Gray._500)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.vertical, 14)
                
                HStack(spacing: 12) {
                    HouseholdButton(
                        type: 1,
                        isSelected: count == 1,
                        action: { count = count == 1 ? 0 : 1 }
                    )
                    
                    HouseholdButton(
                        type: 2,
                        isSelected: count == 2,
                        action: { count = count == 2 ? 0 : 2 }
                    )
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
            }
        }
    }
}

#Preview {
    @Previewable @State var count: Int = 0
    
    Signup.Household(count: $count)
}
