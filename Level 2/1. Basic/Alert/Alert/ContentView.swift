//
//  ContentView.swift
//  Alert
//
//  Created by 이진 on 2023/03/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var isShowingAlert = false
    @State var result: Int = 15
    
    var body: some View {
        VStack {
            Button {
                isShowingAlert = true
            } label: {
                Text("Show Alert")
            }
            Text("\(result)")
            .alert(isPresented: $isShowingAlert) {
//             Alert(title: Text("Nope"),
//                   message: Text("아직 제작중입니다."),
//                   dismissButton: .default(Text("돌아가기"))
//                )
                Alert(title: Text("\(result)"),
                      primaryButton: .default(Text("Ok"), action: {
                    result += 15
                }),
                      secondaryButton: .cancel())
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
