//
//  ContentView.swift
//  MVVM
//
//  Created by 이진 on 2023/04/13.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = PersonViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(viewModel.people) { person in
                HStack {
                    Text(person.name)
                        .font(.title)
                    Text(person.email)
                }
            }
            Button {
                viewModel.reverseOrder()
            } label: {
                Text("Reverse")
            }
            Button {
                viewModel.removeLastPerson()
            } label: {
                Text("RemoveLast")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
