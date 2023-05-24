//
//  OrderDetail.swift
//  YamYam
//
//  Created by 이진 on 2023/05/24.
//

import Foundation

struct OrderDetail: Identifiable, Hashable {
    
    var id: String
    var store : Store
    var product: String
    var productPrice: Int
}
