//
//  ContentView.swift
//  Color
//
//  Created by 이진 on 2023/03/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Color(.blue)
    //            .ignoresSafeArea()
    //            .edgesIgnoringSafeArea([.top, .bottom])
    //            .edgesIgnoringSafeArea(.all)
                .frame(width: 300, height: 300)
            .clipShape(Circle())
            Text("ss")
                .background(Color(.cyan))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
