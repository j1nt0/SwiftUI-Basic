//
//  CartView.swift
//  YamYam
//
//  Created by 이진 on 2023/05/04.
//

import SwiftUI

func a() {
    print("gs")
}

struct CartView: View {
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
                        CartCard()
                        CartCard()
                        CartCard()
                    }
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .ignoresSafeArea()
                        .foregroundColor(Color("Symbol"))
                        .frame(height: 150)
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
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .frame(height: 300)
                .shadow(color: Color(white: 0.1, opacity: 0.1), radius: 5, y: 10)
            VStack {
                HStack(spacing: 10) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 50, height: 50)
                        .foregroundColor(.gray)
                    Text("삼거리팟타이")
                        .font(.system(size: 25))
                    Spacer()
                }
                Divider()
                Spacer()
            }
            .padding()
        }
    }
}
