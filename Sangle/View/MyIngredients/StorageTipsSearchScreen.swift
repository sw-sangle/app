//
//  StorageTipsSearchScreen.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/24/24.
//

import SwiftUI

let data: [StorageTipModel] = [
    StorageTipModel(type: .meats, image: "StorageTips/0", title: "밀봉 포장 후 냉장/냉동", description: "육류는 공기와 접촉하면 빠르게 변질되므로, \n진공 포장하거나 랩으로 밀봉하여 보관하세요.", extra: ["단기(1~2일): 냉장 보관", "장기(2일 이상): 냉동 보관"]),
    StorageTipModel(type: StorageTipsPath.meats, image: "StorageTips/1", title: "냉장고 하단 보관", description: "육류에서 발생할 수 있는 육즙이 다른 식품에 닿지 않도록, 냉장고 하단 칸에 보관하세요.\n플라스틱 용기에 담아 보관하면 더 안전해요", extra: []),
    StorageTipModel(type: .meats, image: "StorageTips/2", title: "해동 시 냉장 해동", description: "육류를 해동할 때 실온이 아닌 냉장실에서 서서히 해동해야 신선도가 유지되고, \n세균 번식을 방지할 수 있습니다.\n빠른 해동이 필요하면 찬물에 담그되, \n밀봉 상태를 유지하세요.", extra: []),
    StorageTipModel(type: .vegetables, image: "StorageTips/3", title: "채소별 습도 조절", description: "잎채소(상추, 시금치): 씻어 물기를 말린 뒤, \n키친타월로 감싸 밀폐 용기에 보관합니다.\n뿌리채소(당근, 감자): 습도 조절이 필요 없으므로 종이봉투나 신문지에 싸서 보관합니다.", extra: []),
    StorageTipModel(type: .vegetables, image: "StorageTips/4", title: "냉장고 서랍 사용", description: "채소는 냉장고 채소 전용 서랍에 보관하면\n적정 온도와 습도를 유지할 수 있어\n더 신선하게 보관됩니다.", extra: []),
    StorageTipModel(type: .vegetables, image: "StorageTips/5", title: "밀폐 용기와 탈산소 팩 활용", description: "잎채소(상추, 시금치): 씻어 물기를 말린 뒤, \n키친타월로 감싸 밀폐 용기에 보관합니다.\n뿌리채소(당근, 감자): 습도 조절이\n필요 없으므로 종이봉투나 신문지에\n싸서 보관합니다.", extra: []),
    StorageTipModel(type: .fruits, image: "StorageTips/6", title: "종류별로 분리 보관", description: "사과, 바나나 같은 과일은 에틸렌 가스를 배출하여 다른 과일의 숙성을 촉진시킵니다.", extra: ["에틸렌 민감한 과일(예: 키위, 감귤류)은\n따로 보관하세요."]),
    StorageTipModel(type: .fruits, image: "StorageTips/7", title: "종이 타월 사용", description: "냉장 보관 시 과일에 습기가 차지 않도록\n밀폐 용기에 종이 타월을 깔아두면 신선도가\n오래 유지됩니다.", extra: []),
    StorageTipModel(type: .fruits, image: "StorageTips/4", title: "숙성 단계에 따라 보관", description: "덜 익은 과일(예: 아보카도, 바나나)은\n실온에서 보관하다가 적당히 익으면\n냉장고로 옮기세요.\n딸기, 블루베리 같은 베리는\n씻지 않은 상태로 냉장 보관 후\n바로 먹기 전에 씻는 것이 좋습니다.", extra: [])
]

struct StorageTipsSearchScreen: View {
    @Binding var path: NavigationPath
    let type: StorageTipsPath
    
    @State var keyword: String = ""
    
    @State var searchResult: [StorageTipModel] = []
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                titleBar
                
                ScrollView(.vertical) {
                    VStack(spacing: 16) {
                        ForEach(searchResult, id: \.self) { item in
                            StorageTipsItem(model: item)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 14)
                    .padding(.bottom, 60)
                }
                
                Spacer()
            }
        }
        .onAppear {
            searchResult = search(type: type, keyword: "")
        }
    }
    
    var titleBar: some View {
        HStack(spacing: 14) {
            Button(action: {
                path.removeLast()
            }) {
                Icon("Icon/arrow_backward", size: 24, color: .Color.black)
            }
            
            Input.Search(keyword: $keyword, placeholder: "검색할 팁을 검색해보세요")
            
            Button(action: {
                searchResult = search(type: type, keyword: keyword)
            }) {
                Icon("Icon/search", size: 24, color: Color(hex: "#1C1B1F"))
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 14)
        .onAppear(perform: UIApplication.shared.hideKeyboard)
    }
    
    func search(type: StorageTipsPath, keyword: String) -> [StorageTipModel] {
           return data.filter { item in
               // 타입이 일치하고
               let typeMatch = item.type == type
               
               // 키워드가 비어있지 않다면
               if !keyword.isEmpty {
                   // 제목이나 설명에 키워드가 포함되어 있는지 확인
                   let titleMatch = item.title.localizedCaseInsensitiveContains(keyword)
                   let descriptionMatch = item.description.localizedCaseInsensitiveContains(keyword)
                   let extraMatch = item.extra.contains { $0.localizedCaseInsensitiveContains(keyword) }
                   
                   return typeMatch && (titleMatch || descriptionMatch || extraMatch)
               }
               
               // 키워드가 비어있다면 타입만 일치하면 됨
               return typeMatch
           }
        }
}

#Preview {
    StorageTipsSearchScreen(path: .constant(NavigationPath([StorageTipsPath.fruits])), type: .fruits)
}
