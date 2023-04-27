//
//  ContentView.swift
//  ColorHex
//
//  Created by 이진 on 2023/04/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red:0.2, green: 0.2, blue: 0.1)
            Color("#FFDD4A")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
