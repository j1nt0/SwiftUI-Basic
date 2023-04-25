//
//  ContentView.swift
//  TextEditor
//
//  Created by 이진 on 2023/04/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var inputText: String = "default"
    
    var body: some View {
        VStack {
            TextEditor(text: $inputText)
                .padding()
                .foregroundColor(.cyan)
                .background(.orange)
                .frame(height: 300)
                .multilineTextAlignment(.center)
                .onChange(of: inputText) { newValue in
                    print(newValue)
                }
            
            TextField("Enter", text: $inputText)
                .multilineTextAlignment(.center)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
