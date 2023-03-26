//
//  ContentView.swift
//  Text
//
//  Created by 이진 on 2023/03/25.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = ""
    @State var text: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello, jin")
                .bold()
                .italic()
                .strikethrough()
                .foregroundColor(.purple)
                .foregroundColor(.purple)
            
            Text("Hello, jin")
                .font(.system(size: 60))
            
            // lineLimit
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
                .foregroundColor(Color(uiColor: .cyan))
              .lineLimit(3)
              .lineSpacing(40)
              .multilineTextAlignment(.center)
            
            // Label
            Label("동그라미", systemImage: "circle")
            
            // Label detailed
            Label {
              Text("john Lee")
                .font(.largeTitle)
            } icon: {
              RoundedRectangle(cornerRadius: 10)
                .fill(.purple)
                .frame(width: 32, height: 32)
            }
            // TextField
            TextField("Enter", text: $name)
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
                .padding()
            
            Text("\(name)")
            
            // TextField - vailation
            TextField("Enter", text: $name)
                .padding()
                .textFieldStyle(.roundedBorder)
                .background(.cyan)
            
            // SecureField - vailation
            SecureField("Enter", text: $name)
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
                .padding()
            
            // TextEditor
            TextEditor(text: $text)
                  .cornerRadius(15)
                  .padding()
                  .background(.blue)
              }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
