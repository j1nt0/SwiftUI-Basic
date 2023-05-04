//
//  HStackApp.swift
//  HStack
//
//  Created by 이진 on 2023/05/03.
//

import SwiftUI
import Firebase

@main
struct HStackApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
