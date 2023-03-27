//
//  ContentView.swift
//  Modal
//
//  Created by 이진 on 2023/03/26.
//

import SwiftUI

struct ContentView: View {
    @State var isShowingModal: Bool = false
    var body: some View {
        VStack {
            Button {
                isShowingModal = true
            } label: {
                Text("Call Modal")
            }
            // Modal
//            .sheet(isPresented: $isShowingModal) {
//                ZStack {
//                    Color.orange.ignoresSafeArea()
//                    Text("I'm modal!")
//                }
//            }
            
            // FullScreenCover
            .fullScreenCover(isPresented: $isShowingModal) {
                ZStack {
                    Color.orange.ignoresSafeArea()
                    VStack {
                        Text("I'm modal!")
                        Button {
                            isShowingModal = false
                        } label: {
                            Image(systemName: "heart")
                        }
                    }
                }
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
