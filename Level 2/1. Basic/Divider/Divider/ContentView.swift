//
//  ContentView.swift
//  Divider
//
//  Created by 이진 on 2023/03/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "heart")
                Divider()
                    .background(.orange)
                    .frame(width: 40, height: 40)
                Text("Isabel")
            }
            Divider()
                .frame(width: 150)
            Text("Jin")
            Divider()
            Text("Olive")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
