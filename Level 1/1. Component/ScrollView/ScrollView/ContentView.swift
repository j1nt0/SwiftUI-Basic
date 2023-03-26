//
//  ContentView.swift
//  ScrollView
//
//  Created by 이진 on 2023/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // Stack은 많이 쌓이면 보이지 않음
//        VStack {
//            Text("1")
//                .frame(width: 50, height: 300)
//                .background(.cyan)
//            Text("2")
//                .frame(width: 50, height: 300)
//                .background(.cyan)
//            Text("3")
//                .frame(width: 50, height: 300)
//                .background(.cyan)
//            Text("4")
//                .frame(width: 50, height: 300)
//                .background(.cyan)
//            Text("5")
//                .frame(width: 50, height: 300)
//                .background(.cyan)
//        }
        ScrollView(.horizontal) {
            HStack {
                Text("1")
                    .frame(width: 50, height: 300)
                    .background(.cyan)
                Text("2")
                    .frame(width: 50, height: 300)
                    .background(.cyan)
                Text("3")
                    .frame(width: 50, height: 300)
                    .background(.cyan)
                Text("4")
                    .frame(width: 50, height: 300)
                    .background(.cyan)
                Text("5")
                    .frame(width: 50, height: 300)
                    .background(.cyan)
            }
        }
        .background(.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
