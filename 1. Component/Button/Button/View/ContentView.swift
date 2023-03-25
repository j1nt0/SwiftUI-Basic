//
//  ContentView.swift
//  Button
//
//  Created by 이진 on 2023/03/25.
//

import SwiftUI

struct ContentView: View {
    @State var showDetails = false
    
    var body: some View {
        VStack {
            // _ title: action:
            Button("Button1") {
                print("Clicked1")
            }
            // action: label:
            Button {
                print("Clicked2")
            } label: {
                Text("Button2")
            }
            Button {
                print("Clicked3")
            } label: {
                Image(systemName: "heart")
                    .background(.purple)
                    .padding()
            }
            Button {
                print("Clicked3")
            } label: {
                Image(systemName: "heart")
                    .padding()
                    .background(.purple)
            }
            Button {
                print("Clicked3")
            } label: {
                Image(systemName: "heart")
                    .padding()
                    .background(.purple)
                    .cornerRadius(13)
            }
            Button {
                print("Clicked3")
            } label: {
                Image(systemName: "heart")
                    .padding()
                    .frame(width: 150)
                    .background(.purple)
                    .cornerRadius(13)
            }
            Button {
                print("Clicked3")
            } label: {
                Image(systemName: "heart")
                    .frame(width: 150)
                    .padding()
                    .background(.purple)
                    .cornerRadius(13)
            }
            // _ title: role: action:
            Button("Delete", role: .destructive) {
                print("deleted")
            }
            // Button using state
            Button {
                    showDetails.toggle()
            } label: {
                    Text("Show details")
            }
//            // Menu Button
//            Menu("copy") {
//                Button("s") {
//
//                }
//                Button("sz") {
//
//                }
//            }
//            // Toggle
//            Toggle("Toggle", isOn: $showDetails)
//                .padding()
//                .background(.orange)
//                .cornerRadius(15)
//                .padding()
//            // Navigation Link
//            NavigationLink(destination: DetailView()) {
//                    Image(systemName: "arrowtriangle.right.circle.fill").resizable()
//                      .frame(width: 50, height: 50)
//                  }.navigationBarTitle("Buttons")
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
