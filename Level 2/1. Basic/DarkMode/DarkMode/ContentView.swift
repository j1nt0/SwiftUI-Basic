//
//  ContentView.swift
//  DarkMode
//
//  Created by 이진 on 2023/03/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // 하나의 색상에서 Default와 Dark를 만들 수 있다.
        Text("[DarkMode]")
            .background(Color("SymbolColor"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
