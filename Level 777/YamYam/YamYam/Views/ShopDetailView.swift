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
        Text(model.name)
    }
}

struct New_Previews: PreviewProvider {
    static var previews: some View {
        ShopDetailView()
    }
}
