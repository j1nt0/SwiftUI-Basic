//
//  ViewModel.swift
//  YamYam
//
//  Created by 이진 on 2023/05/04.
//

import Foundation
import Firebase

class ViewModel2: ObservableObject {
    
    @Published var list = [OrderDetail]()
    
    func append_(a: OrderDetail) {
        self.list.append(a)
    }
    
}
