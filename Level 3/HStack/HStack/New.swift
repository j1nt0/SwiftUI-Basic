//
//  New.swift
//  HStack
//
//  Created by 이진 on 2023/05/04.
//

import SwiftUI

struct New: View {
    
    var model = Storee(name: "", address: "", category: "")
    
    var body: some View {
        Text(model.name)
    }
}

struct New_Previews: PreviewProvider {
    static var previews: some View {
        New()
    }
}
