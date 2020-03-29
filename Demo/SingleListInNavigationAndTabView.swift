//
//  SingleListInNavigationAndTabView.swift
//  Demo
//
//  Created by Gesen on 2020/3/22.
//

import SwiftUI

struct SingleListInNavigationAndTabView: View {
    var body: some View {
        TabView {
            SimpleList()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Tab 1")
                }
        }
        .navigationBarTitle("Simple List in NavigationView", displayMode: .inline)
    }
}

struct SingleListInNavigationAndTabView_Previews: PreviewProvider {
    static var previews: some View {
        SingleListInNavigationAndTabView()
    }
}
