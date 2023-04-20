//
//  ContentView.swift
//  Shape
//
//  Created by 이진 on 2023/04/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Circle()
                .foregroundColor(.orange)
                .frame(width: 100)
            HStackButtons(firstImage: "house", secondImage: "house", thirdImage: "house")
            Rectangle()
                .foregroundColor(.orange)
                .frame(width: 100,height: 100)
            Ellipse()
                .foregroundColor(.orange)
                .frame(width: 100, height: 50)
            Capsule()
                .foregroundColor(.orange)
                .frame(width: 100, height: 50)
            Image(systemName: "cart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .background(.gray)
                .clipShape(Circle())
                .background(.cyan)
        }
    }
}

struct HStackButtons: View {
    var firstImage: String
    var secondImage: String
    var thirdImage: String
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 24)
                    .foregroundColor(.accentColor)
                    .frame(width: 100,height: 100)
                Image(systemName: firstImage)
                    .foregroundColor(.white)
            }
            ZStack {
                RoundedRectangle(cornerRadius: 24)
                    .foregroundColor(.accentColor)
                    .frame(width: 100,height: 100)
                Image(systemName: secondImage)
                    .foregroundColor(.white)
            }
            ZStack {
                RoundedRectangle(cornerRadius: 24)
                    .foregroundColor(.accentColor)
                    .frame(width: 100,height: 100)
                Image(systemName: thirdImage)
                    .foregroundColor(.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
