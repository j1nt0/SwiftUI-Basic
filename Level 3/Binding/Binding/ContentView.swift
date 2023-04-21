//
//  ContentView.swift
//  Binding
//
//  Created by 이진 on 2023/04/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var isTurnedOn: Bool = false
    @State var myText: String = ""
    
    var body: some View {
        VStack {
            Toggle(isOn: $isTurnedOn) {
                Label("bolt", systemImage: isTurnedOn ? "bolt" : "bolt.fill")
            }
            Image(isTurnedOn: $isTurnedOn)
        }
    }
}

struct Image: View {
    
    @Binding var isTurnedOn: Bool
    
    var body: some View {
        Button {
            isTurnedOn.toggle()
        } label: {
            Text("button")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
