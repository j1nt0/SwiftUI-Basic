//
//  ContentView.swift
//  TabView
//
//  Created by 이진 on 2023/03/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ZStack {
                Color.orange
                    .ignoresSafeArea()
                Text("Page1")
            }
                .tabItem {
                    Image(systemName: "heart")
                    Text("item1")
                }
            ZStack {
                Color.cyan
                    .ignoresSafeArea()
                Text("Page2")
            }
                .tabItem {
                    Label("item2", systemImage: "heart")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
