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
    
    @State var selectedTab: Category = .a
    
    var body: some View {
        NavigationStack {
            VStack {
                Head(title: "Shop")
                CategoryTabBar(selectedTab: $selectedTab)
                ScrollView(.horizontal) {
                    switch selectedTab {
                    case .a:
                        LazyHStack {
                            ForEach(model.list, id: \.self) { item in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 9)
                                        .frame(width: 200, height: 200)
                                        .foregroundColor(.secondary)
                                    NavigationLink(item.address, value: item)
                                        .navigationDestination(for: Store.self) {
                                            i in ShopDetailView(model: i)
                                        }
                                }
                            }
                        }
                    case .b:
                        LazyHStack {
                            ForEach(model.list, id: \.self) { item in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 9)
                                        .frame(width: 200, height: 200)
                                        .foregroundColor(.secondary)
                                    NavigationLink(item.address, value: item)
                                        .navigationDestination(for: Store.self) {
                                            i in ShopDetailView(model: i)
                                        }
                                }
                            }
                        }
                    case .c:
                        LazyHStack {
                            ForEach(model.list, id: \.self) { item in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 9)
                                        .frame(width: 200, height: 200)
                                        .foregroundColor(.secondary)
                                    NavigationLink(item.address, value: item)
                                        .navigationDestination(for: Store.self) {
                                            i in ShopDetailView(model: i)
                                        }
                                }
                            }
                        }
                    case .d:
                        LazyHStack {
                            ForEach(model.list, id: \.self) { item in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 9)
                                        .frame(width: 200, height: 200)
                                        .foregroundColor(.secondary)
                                    NavigationLink(item.address, value: item)
                                        .navigationDestination(for: Store.self) {
                                            i in ShopDetailView(model: i)
                                        }
                                }
                            }
                        }
                    case .e:
                        LazyHStack {
                            ForEach(model.list, id: \.self) { item in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 9)
                                        .frame(width: 200, height: 200)
                                        .foregroundColor(.secondary)
                                    NavigationLink(item.address, value: item)
                                        .navigationDestination(for: Store.self) {
                                            i in ShopDetailView(model: i)
                                        }
                                }
                            }
                        }
                    case .f:
                        LazyHStack {
                            ForEach(model.list, id: \.self) { item in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 9)
                                        .frame(width: 200, height: 200)
                                        .foregroundColor(.secondary)
                                    NavigationLink(item.address, value: item)
                                        .navigationDestination(for: Store.self) {
                                            i in ShopDetailView(model: i)
                                        }
                                }
                            }
                        }
                    case .g:
                        LazyHStack {
                            ForEach(model.list, id: \.self) { item in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 9)
                                        .frame(width: 200, height: 200)
                                        .foregroundColor(.secondary)
                                    NavigationLink(item.address, value: item)
                                        .navigationDestination(for: Store.self) {
                                            i in ShopDetailView(model: i)
                                        }
                                }
                            }
                        }
                    }
                }
                Spacer()
            }
        }
        .padding()
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

struct CategoryTabBar: View {
    
    @Binding var selectedTab: Category
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 40) {
                Button {
                    selectedTab = .a
                } label: {
                    Text("전체")
                        .fontWeight(selectedTab == .a ? .bold : .medium)
                        .foregroundColor(selectedTab == .a ? Color("Symbol") : .secondary)
                }
                Button {
                    selectedTab = .b
                } label: {
                    Text("한식")
                        .fontWeight(selectedTab == .b ? .bold : .medium)
                        .foregroundColor(selectedTab == .b ? Color("Symbol") : .secondary)
                }
                Button {
                    selectedTab = .c
                } label: {
                    Text("중식")
                        .fontWeight(selectedTab == .c ? .bold : .medium)
                        .foregroundColor(selectedTab == .c ? Color("Symbol") : .secondary)
                }
                Button {
                    selectedTab = .d
                } label: {
                    Text("패스트푸드")
                        .fontWeight(selectedTab == .d ? .bold : .medium)
                        .foregroundColor(selectedTab == .d ? Color("Symbol") : .secondary)
                }
                Button {
                    selectedTab = .e
                } label: {
                    Text("아시안")
                        .fontWeight(selectedTab == .e ? .bold : .medium)
                        .foregroundColor(selectedTab == .e ? Color("Symbol") : .secondary)
                }
                Button {
                    selectedTab = .f
                } label: {
                    Text("분식")
                        .fontWeight(selectedTab == .f ? .bold : .medium)
                        .foregroundColor(selectedTab == .f ? Color("Symbol") : .secondary)
                }
                Button {
                    selectedTab = .g
                } label: {
                    Text("카페")
                        .fontWeight(selectedTab == .g ? .bold : .medium)
                        .foregroundColor(selectedTab == .g ? Color("Symbol") : .secondary)
                }
            }
        }
        .font(.system(size: 20))
    }
}

struct CategoryTabBarButton: View {
    
    @Binding var selectedTab: Category
    
    var body: some View {
        
        var tab: Category = .a
        
        Button {
            selectedTab = tab
        } label: {
            Text(tab.rawValue)
                .foregroundColor(selectedTab == tab ? Color("Symbol") : .secondary)
        }
    }
}
