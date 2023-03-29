//
//  ContentView.swift
//  TextField_Input
//
//  Created by 이진 on 2023/03/29.
//

import SwiftUI

struct ContentView: View {
    @State var isWho = false
    var color: String  = ""
    
    var body: some View {
        VStack{
            Image(systemName: isWho ? "bolt" : "bolt.fill")
            
            Toggle(isOn: $isWho) { Text("Switch") }
            
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
