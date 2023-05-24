//
//  ViewModel.swift
//  YamYam
//
//  Created by 이진 on 2023/05/04.
//

import Foundation
import Firebase

class ViewModel: ObservableObject {
    
    @Published var list = [Store]()
    @Published var isLoading = false
    
    func getData() {
        
        isLoading = true
        
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
                                         position: d["position"] as? [Double] ?? [0],
                                         point: d["point"] as? Int ?? 0)
                        }
                    }
                }
                self.isLoading = false
            }
            else {
                // Handle the errors
                self.isLoading = false
            }
        }
    }
    
}
