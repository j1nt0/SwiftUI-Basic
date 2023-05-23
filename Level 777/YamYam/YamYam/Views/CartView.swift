//
//  CartView.swift
//  YamYam
//
//  Created by 이진 on 2023/05/04.
//

import SwiftUI

struct CartView: View {
    
//    @Binding var cartTotal: [[Store:[String:Int]]]
    
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
//                        CartCard(cartTotal: $cartTotal)
                        CartCard()
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
    
//    @Binding var cartTotal: [[Store:[String:Int]]]
    
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
                    Text("삼거리팟타이")
                        .font(.system(size: 20))
                    Spacer()
                }
                Divider()
                Text("sssssssss")
                Text("sssssssss")
                Text("sssssssss")
            }
            .padding()
        }
    }
}
