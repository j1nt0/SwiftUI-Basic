//
//  ContentView.swift
//  View
//
//  Created by 이진 on 2023/03/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MyView()
    }
}

struct MyView: View {
    @State private var date = Date()
    @State private var bgColor =
            Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    @State private var current = 67.0
    @State private var minValue = 0.0
    @State private var maxValue = 170.0
    @State private var speed = 50.0
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            // .constant
            DatePicker(selection: .constant(Date()), label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
            
            // $state
            DatePicker(
                    "Start Date",
                    selection: $date,
                    displayedComponents: [.date]
                )
            
            // .constant
            ColorPicker(/*@START_MENU_TOKEN@*/"Title"/*@END_MENU_TOKEN@*/, selection: /*@START_MENU_TOKEN@*/.constant(.red)/*@END_MENU_TOKEN@*/)
            
            // $state
            ColorPicker("Alignment Guides", selection: $bgColor)
            
            // example_1
            Gauge(value: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/, in: /*@START_MENU_TOKEN@*/0...1/*@END_MENU_TOKEN@*/) {
                /*@START_MENU_TOKEN@*/Text("Label")/*@END_MENU_TOKEN@*/
            }
            .blur(radius: speed)
            
            // example_2
            Gauge(value: current, in: minValue...maxValue) {
                        Text("BPM")
                    } currentValueLabel: {
                        Text("\(Int(current))")
                    } minimumValueLabel: {
                        Text("\(Int(minValue))")
                    } maximumValueLabel: {
                        Text("\(Int(maxValue))")
                    }
            Button {
                current -= current/10
            } label: {
                Text("current -")
            }
            Slider(
                value: $speed,
                in: 0...10,
                onEditingChanged: { editing in
                    isEditing = editing
                }
            )
            .border(.secondary)
            .blur(radius: 1)
            Text("\(Int(speed))")
                .foregroundColor(isEditing ? .red : .blue)
                .blur(radius: 1)
            Stepper(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(4)/*@END_MENU_TOKEN@*/, in: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Range@*/1...10/*@END_MENU_TOKEN@*/) {
                Text("Stepper")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
