//
//  ContentView.swift
//  MVVMWithFirebase
//
//  Created by 이진 on 2023/04/25.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @ObservedObject var model = ViewModel()
    
    @State var name = ""
    @State var number = ""
    @State var address = ""
    
    var body: some View {
        VStack {
            List (model.list) { item in
                HStack {
                    Text(item.name)
                        .font(.system(size: 20))
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text(item.category)
                        Text(item.address)
                            .font(.system(size: 15))
                    }
                }
            }
            TextField("name", text: $name)
            TextField("number", text: $number)
            TextField("address", text: $address)
            Button {
                model.addData(name: name, number: number, address: address)
            } label: {
                Text("Add Items")
            }

            Spacer()
                .frame(height: 100)
        }
    }
    
    init() {
        model.getData()
    }
}
//struct ContentView: View {
//
//    @ObservedObject var model = ViewModel()
//
//    @State var name = ""
//    @State var number = ""
//    @State var address = ""
//
//    var body: some View {
//        VStack {
//            List (model.list) { item in
//                HStack {
//                    Text(item.name)
//                        .font(.system(size: 20))
//                    Spacer()
//                    VStack(alignment: .trailing) {
//                        Text(item.category)
//                        Text(item.address)
//                            .font(.system(size: 15))
//                    }
//                }
//            }
//            TextField("name", text: $name)
//            TextField("number", text: $number)
//            TextField("address", text: $address)
//            Button {
//                model.addData(name: name, number: number, address: address)
//            } label: {
//                Text("Add Items")
//            }
//
//            Spacer()
//                .frame(height: 100)
//        }
//    }
//
//    init() {
//        model.getData()
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
