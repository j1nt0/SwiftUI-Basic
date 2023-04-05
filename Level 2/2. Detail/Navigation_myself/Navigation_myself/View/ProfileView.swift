//
//  ProfileView.swift
//  Navigation_myself
//
//  Created by 이진 on 2023/04/05.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Head(title: "My")
                ProfileImage()
                Spacer()
            }
            .padding()
        }
    }
}

struct ProfileImage: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color("Symbol"), lineWidth: 5)
                .frame(width: 250, height: 250)
            Image("profile_img")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .frame(width: 220, height: 220)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
