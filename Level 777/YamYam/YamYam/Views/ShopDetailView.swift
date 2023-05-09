//
//  ShopDetailView.swift
//  YamYam
//
//  Created by 이진 on 2023/05/04.
//

import SwiftUI

struct ShopDetailView: View {
    
    var model = Store(id: "", name: "", number: "", address: "", category: "", menu: ["":0], operatingHour: ["":""], position: [0])

//  예시
//    var a: Store = Store(id: "30DNiNyclYIH5Bi5u5tX", name: "피자스쿨 정릉점", number: "02-919-0066", address: "서울 성북구 보국문로16길 31", category: "패스트푸드", menu: ["페페로니피자": 9900, "핫치킨피자": 10900, "고구마피자": 10900, "치즈피자": 8900, "콤비네이션피자": 10900], operatingHour: ["": ""], position: [37.0, 127.0])
    
    var body: some View {
        ZStack {
//            Color("Symbol")
//                .ignoresSafeArea()
            Image("background_shop_detail")
                .resizable()
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
                            .offset(x: 90, y: -320)
                    case "중식":
                        Text("🍛")
                            .font(.system(size: 150))
                            .offset(x: 70, y: -320)
                    case "패스트푸드":
                        Text("🍔")
                            .font(.system(size: 130))
                            .offset(x: 100, y: -320)
                    case "아시안":
                        Text("🍜")
                            .font(.system(size: 150))
                            .offset(x: 90, y: -320)
                    case "분식":
                        Text("🥟")
                            .font(.system(size: 130))
                            .offset(x: 70, y: -320)
                    case "카페":
                        Text("🍹")
                            .font(.system(size: 150))
                            .offset(x: 70, y: -320)
                    default:
                        Text("")
                    }
                    ScrollView {
                        ForEach(model.menu.sorted(by: >), id: \.key) { key, value in
                            HStack {
                                VStack(alignment: .leading) {
                                    Spacer() //공백
                                    Text(key)
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                    Spacer() //공백
                                    Text(String(value))
                                    Spacer() //공백
                                }
                                Spacer() //공백
                                VStack {
                                    Spacer()//공백
                                    Stepper(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(4)/*@END_MENU_TOKEN@*/) {
                                        
                                    }
                                    
                                    Spacer()//공백
                                }
                            }
                            .frame(height: 100)
                            Divider()
                        }
                    }
                    .padding()
                }
                .offset(y: 50)
            }
                
        }
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
