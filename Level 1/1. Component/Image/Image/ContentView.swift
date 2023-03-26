//
//  ContentView.swift
//  Image
//
//  Created by 이진 on 2023/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("dobong")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .clipped()
            .background(.purple)
            Image("dobong")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .border(.purple, width: 7)
            Image(systemName: "heart.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
            Image(systemName: "sun.min")
                .resizable()
                .frame(width: 50, height: 50)
            Text("SwiftUI Image Tutorial")
                .padding(10)
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .top, endPoint: .bottom))
            Text("SwiftUI tutorial by Hohyeon")
                .foregroundColor(.gray)
              .background(
                Image(systemName: "heart.fill")
                    .resizable()
                    .foregroundColor(.purple)
                    .frame(width: 100, height: 100)
              )
        }
            
            
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
