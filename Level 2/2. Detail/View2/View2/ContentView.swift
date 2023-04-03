//
//  ContentView.swift
//  View2
//
//  Created by 이진 on 2023/04/03.
//

import SwiftUI

struct ContentView: View {
    
    @State var name: String = "No name"
    @State var isPresented: Bool = false
    
    var body: some View {
//        VStack {
//            Text(name)
//                .onAppear { // View가 시작할 때
//                    print("On Appear")
//                }
//                .onDisappear{   // View가 사라질 때
//                    print("On Appear")
//                }
//                .sheet(isPresented: $isPresented) {
//                    Text("Modal")
//                }
//            Button {
//                isPresented.toggle()
//            } label: {
//                Text("Button")
//            }
//
//        }
        NavigationStack{
            NavigationLink("Test") {
                Text("Sample")
            }
            .onAppear { // View가 시작할 때
                print("On Appear")
            }
            .onDisappear{   // View가 사라질 때
                print("On Disappear")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
