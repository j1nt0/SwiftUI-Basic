//
//  ContentView.swift
//  Result
//
//  Created by 이진 on 2023/03/26.
//

import SwiftUI

struct ContentView: View {
    @State var isLighting = false
    
    var body: some View {
        ZStack {
//            Color(.yellow).ignoresSafeArea()
            Color.yellow.edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                Image(systemName: isLighting ? "bolt.fill" : "bolt")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                Spacer()
                HStack {
                    Text("Shoot the")
                    Button {
                        isLighting.toggle()
                    } label: {
                        Text("Thunder!")
                    }
                    .foregroundColor(.secondary)
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
