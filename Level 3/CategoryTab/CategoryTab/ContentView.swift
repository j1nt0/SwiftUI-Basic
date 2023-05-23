//
//  ContentView.swift
//  CategoryTab
//
//  Created by 이진 on 2023/05/17.
//

import SwiftUI

enum Category: String {
    case a = "전체"
    case b = "한식"
    case c = "중식"
    case d = "패스트푸드"
    case e = "아시안"
    case f = "분식"
    case g = "카페"
}

struct Store: Identifiable {
    var id = UUID()
    var name: String
    var category: Category
}

var stores: [Store] = [
    Store(name: "민들레한정식", category: .b),
    Store(name: "자금성", category: .c),
    Store(name: "햇볕팟타이", category: .e),
    Store(name: "미란다짬뽕", category: .c),
    Store(name: "우리동네떡볶이", category: .f),
    Store(name: "곰돌카페", category: .g),
    Store(name: "뜨거마라탕", category: .c)
]

struct ContentView: View {
    
    @State var selectedTab: Category = .a
    
    var body: some View {
        VStack {
            CategoryTabBar(selectedTab: $selectedTab)
            // 카테고리 선택에 따른 아래 내용란
            StoreCards(selectedTab: $selectedTab)
            Spacer()
        }
        .padding(.leading)
    }
}

struct CategoryTabBar: View {
    
    // @Binding 사용
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

struct CategoryTabBarButton: View {
    
    var tab: Category
    // @Binding 사용
    @Binding var selectedTab: Category
    
    var body: some View {
        Button {
            selectedTab = tab
        } label: {
            Text(tab.rawValue)
                .fontWeight(selectedTab == tab ? .bold : .medium)
                .foregroundColor(selectedTab == tab ? .green : .secondary)
                .font(.system(size: 20))
        }
    }
}

struct StoreCards: View {
    
    @Binding var selectedTab: Category
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            switch selectedTab {
            case .a:
                StoreCardsHStack(selectedTab: $selectedTab)
            case .b:
                StoreCardsHStack(selectedTab: $selectedTab)
            case .c:
                StoreCardsHStack(selectedTab: $selectedTab)
            case .d:
                StoreCardsHStack(selectedTab: $selectedTab)
            case .e:
                StoreCardsHStack(selectedTab: $selectedTab)
            case .f:
                StoreCardsHStack(selectedTab: $selectedTab)
            case .g:
                StoreCardsHStack(selectedTab: $selectedTab)
            }
        }
    }
}

struct StoreCardsHStack: View {
    
    @Binding var selectedTab: Category
    
    var body: some View {
        LazyHStack(spacing: 10) {
            ForEach(stores) { store in
                // 현재 탭바의 카테고리가 전체 혹은 Store의 카테고리와 일치할 경우 출력
                if store.category.rawValue == selectedTab.rawValue || selectedTab.rawValue == "전체" {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 100, height: 200)
                            .foregroundColor(.green)
                        Text(store.name)
                        ZStack {
                            Capsule()
                                .frame(width: 50, height: 25)
                                .foregroundColor(.white)
                            Text(store.category.rawValue)
                        }
                        .offset(x: 20, y: -80)
                    }
                }
            }
        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
