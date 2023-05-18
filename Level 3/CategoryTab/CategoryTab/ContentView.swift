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

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
