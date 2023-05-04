//
//  ContentView.swift
//  HStack
//
//  Created by 이진 on 2023/05/03.
//

import SwiftUI
import Firebase

struct Storee: Hashable {
    var name: String
    var address: String
    var category: String
}

enum Category: String {
    case a = "전체"
    case b = "한식"
    case c = "양식"
    case d = "중식"
}

struct ContentView: View {
    
    @ObservedObject var model = ViewModel()
    @State var seletedTab: Category = .a
    
    @State var list: [Storee] = [
        Storee(name: "jin", address: "서울", category: "양식"),
        Storee(name: "joo", address: "경기", category: "양식"),
        Storee(name: "heo", address: "강원", category: "한식"),
        Storee(name: "young", address: "충청", category: "양식")
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(.horizontal) {
                    HStack {
                        Button {
                            seletedTab = .a
                        } label: {
                            Text("전체")
                        }
                        Button {
                            seletedTab = .b
                        } label: {
                            Text("한식")
                        }
                        Button {
                            seletedTab = .c
                        } label: {
                            Text("양식")
                        }
                        Button {
                            seletedTab = .d
                        } label: {
                            Text("중식")
                        }
                    }
                }
                ScrollView(.horizontal) {
                    switch seletedTab {
                    case .a:
                        LazyHStack {
                            ForEach(list, id: \.self) { item in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 9)
                                        .frame(width: 200, height: 200)
                                        .foregroundColor(.secondary)
                                    NavigationLink(item.address, value: item)
                                        .navigationDestination(for: Storee.self) {
                                            it in New(model: it)
                                        }
                                }
                            }
                        }
                    case .b:
                        StoreTabView(selectedTab: .b, list: $list)
                    case .c:
                        StoreTabView(selectedTab: .c, list: $list)
                    case .d:
                        StoreTabView(selectedTab: .d, list: $list)
                    }
                }
                .frame(height: 200)
                .padding()
                //        .frame(height: 80)
                //        .background(.cyan)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct StoreTabView: View {

    var selectedTab: Category
    @Binding var list: [Storee]

    var body: some View {
        LazyHStack {
            ForEach(list, id: \.self) { item in
                if item.category == selectedTab.rawValue {
                    ZStack {
                        RoundedRectangle(cornerRadius: 9)
                            .frame(width: 200, height: 200)
                            .foregroundColor(.secondary)
                        NavigationLink(item.address, value: item)
                            .navigationDestination(for: Storee.self) {
                                it in New(model: it)
                            }
                    }
                }
            }
        }
    }
}
