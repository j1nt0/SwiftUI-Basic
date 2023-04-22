//
//  ContentView.swift
//  Slider
//
//  Created by 이진 on 2023/04/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var speed = 50.0
    @State private var isEditing = false

    var body: some View {
        VStack {
            Slider(
                value: $speed,
                in: 0...100,
                onEditingChanged: { editing in
                    isEditing = editing
                }
            )
            .tint(isEditing ? .red : .blue)
            Text("\(speed)")
                .foregroundColor(isEditing ? .red : .blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
