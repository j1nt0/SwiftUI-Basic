//
//  ProfileView.swift
//  YamYam
//
//  Created by 이진 on 2023/05/04.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Head(title: "My")
            ProfileImage()
            Spacer()
        }
        .padding()
    }
}

struct ProfileImage: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color("Symbol"), lineWidth: 5)
                .frame(width: 250, height: 250)
//            Circle()
//                .frame(width: 220, height: 220)
//                .foregroundColor(.secondary)
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
