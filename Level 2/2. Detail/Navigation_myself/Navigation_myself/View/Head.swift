//
//  Head.swift
//  Navigation_myself
//
//  Created by 이진 on 2023/04/05.
//

import SwiftUI

struct Head: View {
    
    var title: String = "얌얌"
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(Color("Symbol"))
                .font(.system(size: 30))
                .fontWeight(.bold)
            Spacer()
            NavigationLink {
                CartView()
            } label: {
                Image(systemName: "cart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30)
                    .foregroundColor(.primary)
            }
        }
    }
}

struct Head_Previews: PreviewProvider {
    static var previews: some View {
        Head()
    }
}
