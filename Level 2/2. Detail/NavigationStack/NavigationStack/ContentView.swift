//
//  ContentView.swift
//  NavigationStack
//
//  Created by 이진 on 2023/04/03.
//

import SwiftUI

struct ContentView: View {
    @State var number = 3
    
    var body: some View {
        NavigationStack {
            NavigationLink(value: number) {
                Text("test3")
            }.navigationDestination(for: Int.self) { value in
                Text("Jin tried \(value) times")
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
