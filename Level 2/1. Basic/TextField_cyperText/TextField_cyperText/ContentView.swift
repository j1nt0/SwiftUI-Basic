//
//  ContentView.swift
//  TextField_cyperText
//
//  Created by 이진 on 2023/03/31.
//

import SwiftUI

struct ContentView: View {
    
    @State var password: String = ""
    @State var isSecureMode: Bool = true
    
    var body: some View {
        VStack() {
            HStack {
                if isSecureMode {
                    SecureField("Enter Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                } else {
                    TextField("Enter Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                }
                Button {
                    isSecureMode.toggle()
                } label: {
                    Image(systemName: isSecureMode ? "eye" : "lock.fill")
                }
            }
            Text(password)
            

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
