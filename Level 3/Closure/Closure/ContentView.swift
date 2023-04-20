//
//  ContentView.swift
//  Closure
//
//  Created by 이진 on 2023/04/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var myName: String = "Not Yet"
    var myCustomClosureName: (String, String) -> String = { prefix, name in
        return prefix + " " + name
    }
    
    var body: some View {
        VStack {
            Text(myName)
            Button {
//                myName = createName(prefix: "Lee", name: "Jin")
                myName = myCustomClosureName("Lee","Jin")
            } label: {
                Text("Click me")
            }
        }
    }
    func createName(prefix: String, name: String) -> String {
        return prefix + " " + name
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
