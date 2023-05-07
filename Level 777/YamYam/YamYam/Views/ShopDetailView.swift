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
        VStack {
            Text(model.name)
            Text(model.address)
            ForEach(model.menu.k) { key in
                
            }
            Button {
                print("@@@Start@@@")
                print(type(of: model.menu))
                print("@@@Fine@@@")
            } label: {
                Text("Click")
            }

        }
    }
}

struct New_Previews: PreviewProvider {
    static var previews: some View {
        ShopDetailView()
    }
}
