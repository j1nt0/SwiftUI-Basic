//
//  firebaseManager.swift
//  firebase_1
//
//  Created by 이진 on 2023/04/11.
//

import Foundation
import Firebase

class FirestoreManager: ObservableObject {
    @Published var person: String = ""
    
    func fetchRestaurant() {
        let db = Firestore.firestore()

        let docRef = db.collection("person").document("rY8oXh7WAvtFhAo2dXgX")

        docRef.getDocument { (document, error) in
            guard error == nil else {
                print("error", error ?? "")
                return
            }

            if let document = document, document.exists {
                let data = document.data()
                if let data = data {
                    print("data", data)
                    self.person = data["name"] as? String ?? ""
                }
            }

        }
    }
    
    init() {
        fetchRestaurant()
    }
}
