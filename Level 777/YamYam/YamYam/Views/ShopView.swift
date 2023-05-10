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
                                    AsyncImage(url: URL(string: "data:image/png;base64,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"))
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 80, height: 80)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
//                                    RoundedRectangle(cornerRadius: 20)
//                                        .frame(width: 80, height: 80)
//                                        .foregroundColor(.gray)
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
                        i in ShopDetailView(model: i)
                            .navigationBarBackButtonHidden()
                    }
                }
            }
        }

    }
}

