//
//  RecipeDetailScreen.swift
//  Sangle
//
//  Created by 김태영 on 11/24/24.
//

import SwiftUI

struct RecipeDetailScreen: View {
    @Binding var path: NavigationPath
    
    @State var currentIndex: Int = 0
    
    var body: some View {
        VStack {
            Header(title: "레시피", action: { path.removeLast() }, type: .back)
            ScrollView(.vertical) {
                slider
                VStack(spacing: 12)  {
                    title
                    RoundedDivider()
                    ingredients
                    RoundedDivider()
                    steps
                }
                .padding(.horizontal, 20)
            }
        }
    }
    
    var slider: some View {
        TabView(selection: $currentIndex) {
            image.tag(0)
            image.tag(1)
            image.tag(2)
            image.tag(3)
        }
        .frame(height: 252)
        .tabViewStyle(.page)
    }
    
    var image: some View {
        Image("Test/carrot_fried_rice")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: .infinity, height: 252)
            .clipped()
    }
    
    var title: some View {
        VStack(spacing: 6) {
            VStack(alignment: .leading) {
                Text("당근 볶음밥 맛있게 만들기")
                    .typography(.subtitle1Emphasized)
                Text("당근 볶음밥,\n실패없이 만드는 당근 볶음밥 만드는 법 알려드릴게요.")
                    .typography(.body1, color: Color.Gray._500)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            HStack(spacing: 4) {
                Text("초급")
                    .typography(.body1, color: .Gray._500)
                
                HStack(spacing: 0) {
                    Icon("Icon/star_rate", size: 24, color: .Color.gold)
                    Icon("Icon/star", size: 24, color: .Gray._300)
                    Icon("Icon/star", size: 24, color: .Gray._300)
                    Icon("Icon/star", size: 24, color: .Gray._300)
                    Icon("Icon/star", size: 24, color: .Gray._300)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.top, 24)
        .padding(.bottom, 14)
    }
    
    var ingredients: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("재료")
                .typography(.subtitle1)
            VStack(alignment: .leading, spacing: 6) {
                Text("쪽파 1줌")
                    .typography(.body1, color: Color.Gray._500)
                Text("계란 4개")
                    .typography(.body1, color: Color.Gray._500)
                Text("당근 1/6개")
                    .typography(.body1, color: Color.Gray._500)
                Text("설탕 1작은술")
                    .typography(.body1, color: Color.Gray._500)
                Text("설탕 1/2작은술")
                    .typography(.body1, color: Color.Gray._500)
                Text("후춧가루 1/2작은술")
                    .typography(.body1, color: Color.Gray._500)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.vertical, 14)
    }
    
    var steps: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("레시피 단계")
                .typography(.subtitle1)
            VStack(spacing: 36) {
                RecipeStepsItem(step: 1, content: "먼저 계란 4개는 볼에 넣어주세요. 그리고 설탕 1/2작은술과 소금도 1작은술 넣어주고 부드러운 계란말이 팁은 우유를 계란 갯수만큼 4큰술 넣어주세요. 우유가 없으면 물을 넣어도 좋고 후춧가루를 넣어 비린내도 잡아주세요.")
                RecipeStepsItem(step: 2, content: "이제 계란이 잘 풀리도록 섞어주세요. 우유를 넣어주면 훨씬 부드럽게 잘 섞여요. 체에 한번 걸러서 사용해도 부드럽고 좋아요.")
                RecipeStepsItem(step: 3, content: "계란말이 안에 넣어줄 부재료는 취향껏 준비하는데요. 저는 색감을 위한 당근과 쪽파를 송송 썰어주었어요. 당근은 잘잘게 썰어줘야 잘 익어요.")
                RecipeStepsItem(step: 4, content: "다음 단계로는 볼에 섞인 계란물을 달군 팬에 부어주세요. 계란이 익을 때까지 중간 뒤집어가며 익혀주세요. 완성된 계란말이를 그대로 먹어도 좋고 밥과 함께 식사해도 맛있어요.")
                RecipeStepsItem(step: 5, content: "다섯 번째로는 계란말이 반죽에 식용유를 조금 떨어주세요. 반죽이 붙지 않도록 조심스럽게 섞어주세요. 식용유 대신 버터를 사용해도 부드러운 맛이 즐길 수 있어요.")
                RecipeStepsItem(step: 6, content: "여섯 번째로는 부어진 계란말이 반죽을 젓가락으로 가볍게 저어주세요. 계란물이 고르게 익도록 부드럽게 섞어주세요. 젓가락 대신 주걱을 사용해도 괜찮아요.")
                RecipeStepsItem(step: 7, content: "일곱 번째로는 계란물이 반죽에 고루 배포되도록 조심스럽게 섞어주세요. 반죽이 고르게 익을 수 있도록 꼼꼼히 섞어주세요. 섞는 과정에서 너무 세게 젓가락을 휘젓지 않도록 주의해주세요.")
                RecipeStepsItem(step: 8, content: "여덟 번째로는 팬에 기름을 두르고 낮은 불에서 부드럽게 굽기 시작하세요. 계란이 익을 때까지 천천히 구워주세요. 너무 센 불로 구워도 계란물이 탈 수 있으니 주의해주세요.")
                RecipeStepsItem(step: 9, content: "아홉 번째로는 접시에 옮겨 담아 완성된 계란말이를 즐기세요. 계란물이 고루 익어야 맛이 깊어요. 양념을 추가하여 개인 취향에 맞게 맛을 낼 수 있어요.")
                RecipeStepsItem(step: 10, content: "열 번째로는 계란말이를 냉장고에 넣고 식혀주세요. 식혀야 계란물이 꼼꼼히 익어요. 식혀진 계란말이를 먹을 때는 전자레인지에 데워도 맛이 좋아요.")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.vertical, 14)
    }
}

struct RecipeStepsItem: View {
    var step: Int
    var content: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 24) {
            Badge.Number(number: step)
            Text(content)
                .typography(.body1, color: Color.Gray._500)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    RecipeDetailScreen(path: .constant(NavigationPath([HomeScreenPath.recipeDetail])))
}
