//
//  ContentView.swift
//  Stepper
//
//  Created by 이진 on 2023/04/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var value = 0
    
    let colors: [Color] = [.orange, .red, .gray, .blue,
                               .green, .purple, .pink]

    func incrementStep() {
        value += 1
        if value >= colors.count { value = 0 }
        
    }

    func decrementStep() {
        value -= 1
        if value < 0 { value = colors.count - 1 }
    }

    var body: some View {
        Stepper {
            Text("Color: \(colors[value].description),  Button: \(colors[6-value].description)")
        } onIncrement: {
            incrementStep()
        } onDecrement: {
            decrementStep()
        }
        .padding(5)
        .background(colors[value])
        .colorMultiply(colors[6-value])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
