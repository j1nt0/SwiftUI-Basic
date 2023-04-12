//
//  ContentView.swift
//  firebase_1
//
//  Created by 이진 on 2023/04/10.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @State private var documents: [DocumentSnapshot] = []

    var body: some View {
        Text("Firebase Example")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
