//
//  SingleListInNavigtionView.swift
//  Demo
//
//  Created by Gesen on 2020/3/22.
//

import SwiftUI

struct SingleListInNavigtionView: View {
    var body: some View {
        DemoList()
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle("Single List in NavigationView", displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SingleListInNavigtionView()
    }
}
