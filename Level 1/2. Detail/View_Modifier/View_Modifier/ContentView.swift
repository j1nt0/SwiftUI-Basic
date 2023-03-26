//
//  ContentView.swift
//  View_Modifier
//
//  Created by 이진 on 2023/03/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "square.and.arrow.up")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .background(.cyan)
                .padding()
                .background(.gray)
            
            Image(systemName: "square.and.arrow.up")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .background(.cyan)
                .padding()
                .background(.gray)
        }
        .frame(
              maxWidth: .infinity,
              maxHeight: .infinity,
              alignment: .center
            )
        .background(.cyan)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
