//
//  MenuView.swift
//  Demo
//
//  Created by Gesen on 2020/3/22.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: SingleListInNavigtionView()) {
                    Text("Single List in NavigationView")
                }
                
                NavigationLink(destination: SingleListInNavigationAndTabView()) {
                    Text("Single List in NavigationView and TabView")
                }
                
                NavigationLink(destination: SingleListWithoutNavigationView()) {
                    Text("Single List without NavigationView")
                }
                
                NavigationLink(destination: MutipleListView()) {
                    Text("Mutiple List")
                }
            }
            .navigationBarTitle("Refresh", displayMode: .inline)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
