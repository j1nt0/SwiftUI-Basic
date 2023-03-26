//
//  ContentView.swift
//  Spacer
//
//  Created by 이진 on 2023/03/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
                .foregroundColor(.accentColor)
            
            // spacer
            Spacer()
            
            HStack {
                Text("Hello, world!")
                Spacer()
                Text("Hello, world!")
            }.padding(.horizontal, 30)
            
            // spacer
            Spacer()
            
            Button {
                print("hi")
            } label: {
                Text("world")
            }
        }
        .padding(.vertical, 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
