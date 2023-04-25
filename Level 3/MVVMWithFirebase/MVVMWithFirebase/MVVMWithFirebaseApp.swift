//
//  MVVMWithFirebaseApp.swift
//  MVVMWithFirebase
//
//  Created by 이진 on 2023/04/25.
//

import SwiftUI
import Firebase

@main
struct MVVMWithFirebaseApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
