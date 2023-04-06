//
//  HomeView.swift
//  Navigation_myself
//
//  Created by 이진 on 2023/04/05.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Head(title: "얌얌")
            Spacer()
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
