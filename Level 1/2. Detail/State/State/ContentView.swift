//
//  ContentView.swift
//  State
//
//  Created by 이진 on 2023/03/26.
//

import SwiftUI

struct ContentView: View {
    // State 변수가 바뀌면 새로 그린다.
    @State var name : String = ""
    
    struct Ocean: Identifiable {
        let name: String
        let id = UUID()
    }

    private var oceans = [
        Ocean(name: "Pacific"),
        Ocean(name: "Atlantic"),
        Ocean(name: "Indian"),
        Ocean(name: "Southern"),
        Ocean(name: "Arctic")
    ]
    
    var body: some View {
        VStack {
            TextField(
                "User name (email address)",
                text: $name
            )
            .padding()
            .textFieldStyle(.roundedBorder)
            
            Text(name)
            
            List(oceans) {
                    Text($0.name)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
