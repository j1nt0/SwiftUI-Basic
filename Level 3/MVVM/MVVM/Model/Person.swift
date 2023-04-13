//
//  Person.swift
//  MVVM
//
//  Created by 이진 on 2023/04/13.
//

import SwiftUI

struct Person: Identifiable {
    var id = UUID()
    var name: String
    var email: String
    var phoneNumber: String
}
