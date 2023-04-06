//
//  ContentView.swift
//  How to Hide TabBar in NavigationView When Using SwiftUI
//
//  Created by 이진 on 2023/04/06.
//

import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct ContentView: View {
//    @State var tabSelection: Tabs = .tab1
//    var body: some View {
//        TabView(selection: $tabSelection){
//            NavigationView{ //if you write the NavigationView here, you cannot remove TabBar after navigation
//                NavigationLink(destination: NavigatedView()){
//                    VStack{
//                        Text("Here is Tab 1")
//                        Text("Tap me to NavigatedView")
//                    }
//                    .navigationBarTitle("Tab1")
//                }
//            }
//            .tabItem { Text("Tab 1") }
//            .tag(Tabs.tab1)
//
//            NavigationView{//Tab2 also has a NavigationView
//                NavigationLink(destination: NavigatedView()){
//                    VStack{
//                        Text("Here is Tab 2")
//                        Text("Tap me to NavigatedView")
//                    }
//                    .navigationBarTitle("Tab2")
//                }
//            }
//            .tabItem { Text("Tab 2") }
//            .tag(Tabs.tab2)
//        }
//    }
//
//    enum Tabs{
//        case tab1, tab2
//    }
//}

struct ContentView: View {
    @State var tabSelection: Tabs = .tab1
    var body: some View {
        NavigationView{
            TabView(selection: $tabSelection){
//                NavigationView{ //if you write the NavigationView here, you cannot remove TabBar after navigation
                    NavigationLink(destination: NavigatedView()){
                        VStack{
                            Text("Here is Tab 1")
                            Text("Tap me to NavigatedView")
                        }
                        .navigationBarTitle("Tab1")//NavigationBarTitle does not work here
                    }
//                }
                    .tabItem { Text("Tab 1") }
                .tag(Tabs.tab1)
                
//                NavigationView{//Tab2 also has a NavigationView
                    NavigationLink(destination: NavigatedView()){
                        VStack{
                            Text("Here is Tab 2")
                            Text("Tap me to NavigatedView")
                        }
                        .navigationBarTitle("Tab2")//NavigationBarTitle does not work here
                    }
//                }
                    .tabItem { Text("Tab 2") }
                .tag(Tabs.tab2)
            }
        }
    }
    
    enum Tabs{
        case tab1, tab2
    }
}

struct NavigatedView: View {
    var body: some View {
        Text("Hi! This is the NavigatedView")
            .navigationBarTitle("NavigatedView")
    }
}
