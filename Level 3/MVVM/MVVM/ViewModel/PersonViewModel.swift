//
//  PersonViewModel.swift
//  MVVM
//
//  Created by 이진 on 2023/04/13.
//

import SwiftUI

class PersonViewModel: ObservableObject {
    @Published var people: [Person] = []
    
    init() {
        addPeople()
    }
    
    func addPeople() {
        people = peopleData
    }
    
    func shuffleOrder() {
        people.shuffle()
    }
    
    func reverseOrder() {
        people.reverse()
    }
    
    func removeLastPerson() {
        people.removeLast()
    }
}

let peopleData = [
    Person(name: "Paul Atreides", email: "Paul@naver.com", phoneNumber: "111-1111"),
    Person(name: "Lady Jessica", email: "Jessica@naver.com", phoneNumber: "222-2222"),
    Person(name: "Duke Atreides", email: "Leto@naver.com", phoneNumber: "333-3333"),
    Person(name: "Baron Harkonnen", email: "Harkonnen@naver.com", phoneNumber: "444-4444"),
    Person(name: "Duncan Idaho", email: "Duncan@naver.com", phoneNumber: "555-5555")
]
