//
//  ContentView.swift
//  Navigation_myself
//
//  Created by 이진 on 2023/04/04.
//

import SwiftUI

enum Tab {
    case home
    case shop
    case profile
}

struct TabButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
//            .opacity(configuration.isPressed ? 0.9 : 1)
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
    }
}

struct ContentView: View {
    
    @State var selectedTab: Tab = .home
    @State var ab: Bool = true
    
    var body: some View {
        VStack {
            switch selectedTab {
            case .home:
                NavigationView {
                    HomeView(ab: $ab)
                }
            case .shop:
                NavigationView {
                    ShopView()
                }
            case .profile:
                NavigationView {
                    ProfileView()
                }
            }
            if ab == true {
                CustomTabView(selectedTab: $selectedTab)
                    .buttonStyle(TabButtonStyle())
            } else {
                CustomTabView(selectedTab: $selectedTab)
                    .buttonStyle(TabButtonStyle())
                    .hidden()
            }
        }
    }
}

struct CustomTabView: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .offset(y: 15)
            HStack {
                Spacer()
                Button {
                    selectedTab = .home
                } label: {
                    Image(systemName: selectedTab == .home ? "house.fill" : "house")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30)
                        .foregroundColor(.white)
                }
                Spacer()
                Button {
                    selectedTab = .shop
                } label: {
                    ZStack {
                        Circle()
                            .foregroundColor(Color("Symbol"))
                            .frame(width: 90, height: 90)
//                            .shadow(radius: 10)
                        Image(systemName: selectedTab == .shop ? "basket.fill" : "basket")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40)
                            .foregroundColor(.white)
                    }
                    .offset(y: -32)
                }
                Spacer()
                Button {
                    selectedTab = .profile
                } label: {
                    Image(systemName: selectedTab == .profile ? "person.fill" : "person")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30)
                        .foregroundColor(.white)
                }
                Spacer()
            }
        }
        .frame(height: 50)
    }
}

struct HomeView: View {
    @Binding var ab: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("얌얌")
                        .foregroundColor(Color("Symbol"))
                        .font(.system(size: 30))
                        .fontWeight(.heavy)
                    Spacer()
                    NavigationLink {
                        CartView(ab: $ab)
                    } label: {
                        Image(systemName: "cart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                            .foregroundColor(.primary)
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct ShopView: View {
    var body: some View {
        Color(.systemGray6)
            .ignoresSafeArea()
            .navigationTitle(Text("Shop"))
    }
}

struct ProfileView: View {
    var body: some View {
        Color(.systemGray6)
            .ignoresSafeArea()
            .navigationTitle(Text("Profile"))
            .zIndex(1)
    }
}

struct CartView: View {
    
    @Binding var ab: Bool
    
    var body: some View {
        Color(.systemGray6)
            .ignoresSafeArea()
            .navigationTitle(Text("Cart"))
            .onAppear {
                ab = false
            }
            .onDisappear{
                ab = true
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}