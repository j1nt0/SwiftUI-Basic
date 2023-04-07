//
//  ContentView.swift
//  TabView
//
//  Created by 이진 on 2023/03/28.
//

import SwiftUI

enum Tab {
    case first
    case second
    case third
}

struct ContentView : View {
    @State var selectedTab: Tab = .first
    var body: some View {
        VStack {
            Spacer()
            switch selectedTab {
            case .first:
                Text("The First Tab")
            case .second:
                Text("The Second Tab")
            case .third:
                Text("The Third Tab")
            }
            Spacer()
            CustomTabView(selectedTab: $selectedTab)
        }
    }
}

struct CustomTabView: View {
    @Binding var selectedTab: Tab
    var body: some View {
        HStack {
            Spacer()
            Button() {
                selectedTab = .first
            } label: {
                Image(systemName: "1.square")
            }
            Spacer()
            ZStack {
                Circle()
                    .foregroundColor(Color(.orange))
                    .frame(width: 90, height: 90)
                Button {
                    selectedTab = .second
                } label: {
                    Image(systemName: "2.square")
                }
            }
            .offset(y: -32)
            Spacer()
            Button {
                selectedTab = .third
            } label: {
                Image(systemName: "3.square")
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
