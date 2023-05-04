//
//  ViewModel.swift
//  HStack
//
//  Created by 이진 on 2023/05/04.
//

import Foundation
import Firebase

class ViewModel: ObservableObject {
    
    @Published var list = [Store]()
    
    func addData(name: String, number: String, address: String) {
        
        let db = Firestore.firestore()
        
        db.collection("shop").addDocument(data: ["name" : name, "number" : number, "address": address]) {error in
            
            // Check the errors
            if error == nil {
                // No errors
                
                // Call get data to retrieve latest data
                self.getData()
            }
            else {
                // Handle the error
                
            }
            
        }
        
    }
    
    func getData() {
        
        let db = Firestore.firestore()
        
        db.collection("shop").getDocuments { snapshot, error in
            
            if error == nil {
                // No errors
                
                if let snapshot = snapshot {
                    
                    // Update the list property in the main thread
                    DispatchQueue.main.async {
                        
                        self.list = snapshot.documents.map { d in
                            return Store(id: d.documentID,
                                         name: d["name"] as? String ?? "",
                                         number: d["number"] as? String ?? "",
                                         address: d["address"] as? String ?? "",
                                         category: d["category"] as? String ?? "",
                                         menu: d["menu"] as? [String:Int] ?? ["":0],
                                         operatingHour: d["menu"] as? [String:String] ?? ["":""],
                                         position: d["position"] as? [Double] ?? [0])
                        }
                    }
                }
            }
            else {
                // Handle the errors
            }
        }
    }
    
}
