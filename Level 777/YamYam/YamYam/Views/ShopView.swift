//
//  ShopView.swift
//  YamYam
//
//  Created by 이진 on 2023/05/04.
//

import SwiftUI
import Firebase

enum Category: String {
    case a = "전체"
    case b = "한식"
    case c = "중식"
    case d = "패스트푸드"
    case e = "아시안"
    case f = "분식"
    case g = "카페"
}

struct ShopView: View {
    
    @ObservedObject var model = ViewModel()
    
    @State var name = ""
    @State var number = ""
    @State var address = ""
    @State var category = ""
    @State var menu = ["":0]
    
    @State var selectedTab: Category = .a
    
    var body: some View {
        NavigationStack {
            VStack {
                Head(title: "Shop")
                    .padding()
                CategoryTabBar(selectedTab: $selectedTab)
                    .padding(.leading)
                ZStack {
                    if model.isLoading {
                        ProgressView()
                    }
                    StoreCards(selectedTab: $selectedTab, model: model)
                        .padding(.leading)
                        .frame(height: 550)
                }
                Spacer()
            }
        }
    }
    
    init() {
        model.getData()
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}


// 카테고리 탭바
struct CategoryTabBar: View {
    
    @Binding var selectedTab: Category
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 40) {
                CategoryTabBarButton(tab: .a, selectedTab: $selectedTab)
                CategoryTabBarButton(tab: .b, selectedTab: $selectedTab)
                CategoryTabBarButton(tab: .c, selectedTab: $selectedTab)
                CategoryTabBarButton(tab: .d, selectedTab: $selectedTab)
                CategoryTabBarButton(tab: .e, selectedTab: $selectedTab)
                CategoryTabBarButton(tab: .f, selectedTab: $selectedTab)
                CategoryTabBarButton(tab: .g, selectedTab: $selectedTab)
            }
        }
    }
}

// 카테고리 탭바 버튼 커스터마이징
struct CategoryTabBarButton: View {
    
    var tab: Category
    @Binding var selectedTab: Category
    
    var body: some View {
        Button {
            selectedTab = tab
        } label: {
            Text(tab.rawValue)
                .fontWeight(selectedTab == tab ? .bold : .medium)
                .foregroundColor(selectedTab == tab ? Color("Symbol") : .secondary)
                .font(.system(size: 20))
        }
    }
}

// 카테고리 탭바 선택에 따른 카드 변화
struct StoreCards: View {
    
    @Binding var selectedTab: Category
    @ObservedObject var model = ViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            switch selectedTab {
            case .a:
                StoreCardsHStack(selectedTab: $selectedTab, model: model)
            case .b:
                StoreCardsHStack(selectedTab: $selectedTab, model: model)
            case .c:
                StoreCardsHStack(selectedTab: $selectedTab, model: model)
            case .d:
                StoreCardsHStack(selectedTab: $selectedTab, model: model)
            case .e:
                StoreCardsHStack(selectedTab: $selectedTab, model: model)
            case .f:
                StoreCardsHStack(selectedTab: $selectedTab, model: model)
            case .g:
                StoreCardsHStack(selectedTab: $selectedTab, model: model)
            }
        }
    }
}

// 카테고리 선택에 따른 카드의 변화를 하나의 뷰로 정리
struct StoreCardsHStack: View {
    
    @Binding var selectedTab: Category
    @ObservedObject var model = ViewModel()
    
    var body: some View {
        LazyHStack(spacing: 30) {
            ForEach(model.list, id: \.self) { item in
                // 현재 탭바의 카테고리가 전체 혹은 Store의 카테고리와 일치할 경우 출력
                if item.category == selectedTab.rawValue || selectedTab.rawValue == "전체" {
                    NavigationLink(value: item){
                        ZStack {
                            Image("card")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height:350)
                            switch item.category {
                            case "한식":
                                Text("🍲")
                                    .font(.system(size: 170))
                                    .offset(x: 40, y: -170)
                            case "중식":
                                Text("🍛")
                                    .font(.system(size: 170))
                                    .offset(x: 40, y: -170)
                            case "패스트푸드":
                                Text("🍔")
                                    .font(.system(size: 150))
                                    .offset(x: 45, y: -150)
                            case "아시안":
                                Text("🍜")
                                    .font(.system(size: 160))
                                    .offset(x: 45, y: -170)
                            case "분식":
                                Text("🥟")
                                    .font(.system(size: 150)) 
                                    .offset(x: 45, y: -150)
                            case "카페":
                                Text("🍹")
                                    .font(.system(size: 150))
                                    .offset(x: 45, y: -150)
                            default:
                                Text("")
                            }
                            HStack {
                                VStack(alignment: .leading, spacing: 5) {
                                    // Store 별 이미지
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 80, height: 80)
                                        .foregroundColor(.gray)
                                    Text(item.name)
                                        .font(.system(size: 35))
                                    Text(item.address)
                                }
                                .offset(y: 50)
                                .padding()
                                .foregroundColor(.white)
                                .fontWeight(.heavy)
                                Spacer()
                            }
                        }
                    }
                    .navigationDestination(for: Store.self) {
                        i in testJustLikeThat(model: i)
                            .navigationBarBackButtonHidden()
                    }
                }
            }
        }

    }
}

