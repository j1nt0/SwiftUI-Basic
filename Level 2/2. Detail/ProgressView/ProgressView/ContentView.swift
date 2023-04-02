//
//  ContentView.swift
//  ProgressView
//
//  Created by 이진 on 2023/04/01.
//

import SwiftUI

struct ContentView: View {
    
    @State var progress: Double = 0
    
    var body: some View {
        VStack {
            ProgressView("Loading...", value: progress, total: 100)
            
            ProgressView()
            
            Button {
                progress += 15
            } label: {
                Text("Go")
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
