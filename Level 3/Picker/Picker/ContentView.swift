//
//  ContentView.swift
//  Picker
//
//  Created by 이진 on 2023/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var pickedItem: Int = 0
    
    var body: some View {
        VStack {
            Text(pickedItem.description)
            
            Picker(selection: $pickedItem, label: Text("Picker")) {
                Text("1").tag(1)
                Text("2").tag(2)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
