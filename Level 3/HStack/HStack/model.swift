//
//  model.swift
//  HStack
//
//  Created by 이진 on 2023/05/04.
//

import Foundation

struct Store: Identifiable {
    
    var id: String
    var name: String
    var number: String
    var address: String
    var category: String
    var menu: Dictionary<String, Int>
    var operatingHour: Dictionary<String, String>
    var position: Array<Double>
    
}
