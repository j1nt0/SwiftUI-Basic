//
//  firebase_1App.swift
//  firebase_1
//
//  Created by 이진 on 2023/04/10.
//

import SwiftUI
import FirebaseCore

@main
struct firebase_1App: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
