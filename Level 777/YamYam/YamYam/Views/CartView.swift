//
//  CartView.swift
//  YamYam
//
//  Created by 이진 on 2023/05/04.
//

import SwiftUI

struct CartView: View {
    
    @StateObject var order = ViewModel2()
    
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()
            VStack {
                CartHead()
                    .padding()
                ScrollView {
                    // 카드 간 간격
                    VStack(spacing: 20) {
                        // 카드
                        ForEach(order.list, id: \.self) { item in
                            CartCard(orderStorename: item.store.name, orderFood: item.product, orderPrice: String(item.productPrice))
                        }
                    }
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .ignoresSafeArea()
                        .foregroundColor(Color("Symbol"))
                        .frame(height: 150)
                    VStack {
                        Text("g")
                        Button {
                            
                        } label: {
                            Text("Checkout")
                        }
                        .frame(width: 200)
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.capsule)
                    }
                }
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}

struct CartHead: View {
    
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
                    .foregroundColor(Color(.darkGray))
            }
            Spacer()
            Text("Cart")
                .font(.system(size: 30))
                .fontWeight(.semibold)
                .foregroundColor(Color("Symbol"))
        }
    }
}

struct CartCard: View {
    
    var orderStorename = "삼거리팟타이"
    var orderFood = "팟타이"
    var orderPrice = "₩ 2000"
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .shadow(color: Color(white: 0.1, opacity: 0.1), radius: 5, y: 10)
            VStack(alignment: .leading) {
                HStack(spacing: 10) {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 40, height: 40)
                        .foregroundColor(.gray)
                    Text(orderStorename)
                        .font(.system(size: 20))
                    Spacer()
                }
                Divider()
                HStack {
                    Text(orderFood)
                    Spacer()
                    Text(orderPrice)
                }
            }
            .padding()
        }
    }
}
