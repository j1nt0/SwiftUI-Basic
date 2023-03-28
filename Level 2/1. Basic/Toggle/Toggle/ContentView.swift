//
//  ContentView.swift
//  Toggle
//
//  Created by 이진 on 2023/03/28.
//

import SwiftUI

struct ContentView: View {
    
    @State var isOn = false
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: isOn ? "bolt.fill" : "bolt")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
            Spacer()
            Toggle(isOn: $isOn) {
                if isOn == true {
                    Text("isLightOn")
                } else {
                    Text("isLightOff")
                }
            }
            .toggleStyle(.switch)
            .tint(.blue)
            Spacer()
            Button {
                isOn.toggle()
            } label: {
                Text("jin")
            }
            .tint(.orange)

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
