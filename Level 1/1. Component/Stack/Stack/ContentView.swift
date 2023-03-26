//
//  ContentView.swift
//  Stack
//
//  Created by 이진 on 2023/03/25.
//

import SwiftUI

struct ContentView: View {
    @State var showingSheet = false
    
    var body: some View {
//        VStack {
//            Text("1")
//            Text("2")
//            HStack {
//                Text("1")
//                Text("2")
//            }
//        }
//        ZStack {
//            RoundedRectangle(cornerRadius: 15)
//                .frame(width: 80, height: 80)
//            Image(systemName: "heart.fill")
//                .resizable()
//                .frame(width: 50, height: 50)
//                .foregroundColor(.cyan)
//            Text("1")
//                .foregroundColor(.white)
//        }
        VStack(alignment: .center) {
            Text("1")
            Text("1")
            Text("1")
            Text("1")
            Button(action: {
                    self.showingSheet = true
                }) {
                    Text("Action Sheet 띄우기")
                }
                .confirmationDialog("타이틀", isPresented: $showingSheet) {
                  Button("제거", role: .destructive) {}
                  Button("취소", role: .cancel) {}
                }
        }
        // VStack에는 10개가 최대!
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
