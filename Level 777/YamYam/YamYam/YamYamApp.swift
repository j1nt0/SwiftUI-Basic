//
//  YamYamApp.swift
//  YamYam
//
//  Created by 이진 on 2023/05/04.
//

import SwiftUI
import Firebase

@main
struct YamYamApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
