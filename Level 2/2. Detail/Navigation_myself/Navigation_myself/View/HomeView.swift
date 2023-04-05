//
//  HomeView.swift
//  Navigation_myself
//
//  Created by 이진 on 2023/04/05.
//

import SwiftUI

struct HomeView: View {
    
    @State var isShow: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Head(title: "얌얌")
                Spacer()
                Button {
                    isShow.toggle()
                } label: {
                    Image(systemName: "heart")
                }
                .fullScreenCover(isPresented: $isShow) {
                    Button {
                        isShow.toggle()
                    } label: {
                        Image(systemName: "heart.fill")
                    }

                }
                Spacer()
            }
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
