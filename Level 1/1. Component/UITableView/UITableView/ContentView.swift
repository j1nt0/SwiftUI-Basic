//
//  ContentView.swift
//  UITableView
//
//  Created by 이진 on 2023/03/25.
//

import SwiftUI

struct Person: Identifiable {
    var id = UUID()
    let name: String
    let imageName: String
}

struct ContentView: View {
    var body: some View {
        
        //  정적으로 List 생성
        //        List {
        //            HStack {
        //                Image(systemName: "heart.fill")
        //                Text("Jin")
        //            }
        //            HStack {
        //                Image(systemName: "heart")
        //                Text("Olive")
        //            }
        //            HStack {
        //                Image(systemName: "bolt")
        //                Text("Bon")
        //            }
        //        }
        
        //        let names: [String] = ["Jin", "Olive", "Bon"]
        
        //        List(names, id: \.self) {name in
        //            Text(name)
        //        }
        // 동적으로 List 생성
        let people : [Person] = [Person(name: "Jin", imageName: "heart"),
                                 Person(name: "Olive", imageName: "heart.fill"),
                                 Person(name: "Bon", imageName: "bolt")]
        
        List (people){person in
            Section {
                HStack {
                    Image(systemName: person.imageName)
                    Text(person.name)
                }
                HStack {
                    Image(systemName: person.imageName)
                    Text(person.name)
                }
                HStack {
                    Image(systemName: person.imageName)
                    Text(person.name)
                }
            } header: {
                Text("Header")
            } footer: {
                Text("Footer")
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
