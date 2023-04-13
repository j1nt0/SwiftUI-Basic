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
        List(documents, id: \.documentID) { document in
            HStack {
                Text(document.data()?["name"] as? String ?? "")
                    .font(.system(size: 20))
                Spacer()
                VStack(alignment: .trailing) {
                    Text(document.data()?["category"] as? String ?? "")
                    Text(document.data()?["address"] as? String ?? "")
                        .font(.system(size: 15))
                }
            }
        }
        .onAppear {
            let db = Firestore.firestore()
            db.collection("shop").getDocuments { querySnapshot, error in
                if let error = error {
                    print("Error getting documents: \(error.localizedDescription)")
                } else {
                    self.documents = querySnapshot?.documents ?? []
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
