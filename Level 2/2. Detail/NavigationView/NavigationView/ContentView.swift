//
//  ContentView.swift
//  NavigationView
//
//  Created by 이진 on 2023/04/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
//                HStack {
//                    Text("hello")
//                        .padding()
//                        .font(.system(size: 32))
//                        .bold()
//                    Spacer()
//                }
                NavigationLink(destination: Text("test1")){
                    ZStack {
                        Color.cyan
                        Text("test")
                            
                    }
                }
            }
            .navigationTitle("hello")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
