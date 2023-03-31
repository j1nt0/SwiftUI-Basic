//
//  ContentView.swift
//  TextField_Input
//
//  Created by 이진 on 2023/03/29.
//

import SwiftUI

struct ContentView: View {
    
    @State var userID: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("ID")
            TextField("Enter your ID", text: $userID)
                .textFieldStyle(.roundedBorder)
            Text(userID=="" ? "ID = 입력 값 없음" : "ID = \(userID)")
        }
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
