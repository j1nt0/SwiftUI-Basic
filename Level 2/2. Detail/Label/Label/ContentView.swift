//
//  ContentView.swift
//  Label
//
//  Created by 이진 on 2023/04/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // HStack으로 구현한 Label
            HStack {
                Image(systemName: "heart.fill")
                Text("Jin")
            }
            // Label_1
            Label("Jin", systemImage: "heart")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
