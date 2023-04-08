//
//  ContentView.swift
//  Result
//
//  Created by 이진 on 2023/04/08.
//

import SwiftUI

//Color (다크모드)
//Divider
//sheet, modal
//Alert
//TabView
//onDisappear, onAppear
//progressView
//TextField
//Secure Field
//Toggle
//NavigationView
//NavigationStack
//Label

struct ContentView: View {
    
    @State var userID: String = ""
    @State var userPassword: String = ""
    @State var hasLoggedIn: Bool = false
    @State var hasShownPassword: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Label {
                    Text("ID : ")
                } icon: {
                    Image(systemName: "person.fill")
                }
                TextField("Enter ID", text: $userID)
            }
            Divider()
            HStack {
                Label {
                    Text("PW : ")
                } icon: {
                    Image(systemName: !hasShownPassword ? "lock.fill" :
                    "eye")
                }
                if hasShownPassword {
                    SecureField("Enter Password", text: $userPassword)
                } else {
                    TextField("Enter Password", text: $userPassword)
                }
                Toggle("show", isOn: $hasShownPassword)
            }
            Button {
                if userID == "Jin" && userPassword == "1234" {
                    hasLoggedIn = true
                } else {
                    hasLoggedIn = false
                }
            } label: {
                Text("Sign in")
                    .background()
            }
        }
        .padding()
        .sheet(isPresented: $hasLoggedIn) {
            Text("Login!!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
