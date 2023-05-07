//
//  ShopDetailView.swift
//  YamYam
//
//  Created by 이진 on 2023/05/04.
//

import SwiftUI

struct ShopDetailView: View {
    
    var model = Store(id: "", name: "", number: "", address: "", category: "", menu: ["":0], operatingHour: ["":""], position: [0])
    
    var body: some View {
        ZStack {
            Color("Symbol")
                .ignoresSafeArea()
            VStack {
                ShopDetailHead()
                    .padding()
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(model.name)
                            .font(.system(size: 35))
                        Text(model.address)
                    }
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    Spacer()
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundColor(.white)
                    switch model.category {
                    case "한식":
                        Text("🍲")
                            .font(.system(size: 150))
                            .offset(x: 100, y: -340)
                    case "중식":
                        Text("🍛")
                            .font(.system(size: 150))
                            .offset(x: 100, y: -340)
                    case "패스트푸드":
                        Text("🍔")
                            .font(.system(size: 150))
                            .offset(x: 100, y: -340)
                    case "아시안":
                        Text("🍜")
                            .font(.system(size: 150))
                            .offset(x: 100, y: -340)
                    case "분식":
                        Text("🥟")
                            .font(.system(size: 150))
                            .offset(x: 100, y: -340)
                    case "카페":
                        Text("🍹")
                            .font(.system(size: 150))
                            .offset(x: 100, y: -340)
                    default:
                        Text("")
                    }
                    ScrollView {
                        ForEach(model.menu.sorted(by: >), id: \.key) { key, value in
                            Text(key)
                            
                        }
                    }
                }
                .offset(y: 60)
            }
                
        }
//        VStack {
//            Text(model.name)
//            Text(model.address)
//            ForEach(model.menu.sorted(by: >), id: \.key) { key, value in
//                Text(key)
//            }
//            Button {
//                print("@@@Start@@@")
//                print(type(of: model.menu))
//                print("@@@Fine@@@")
//            } label: {
//                Text("Click")
//            }
//        }
    }
}

struct New_Previews: PreviewProvider {
    static var previews: some View {
        ShopDetailView()
    }
}

struct ShopDetailHead: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "arrow.backward")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30)
                    .foregroundColor(.white)
            }
            Spacer()
            NavigationLink {
                CartView()
            } label: {
                Image(systemName: "cart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30)
                    .foregroundColor(.white)
            }
        }
    }
}
