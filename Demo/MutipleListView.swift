//
//  MutipleListView.swift
//  Demo
//
//  Created by Gesen on 2020/3/22.
//

import SwiftUI

struct MutipleListView: View {
    var body: some View {
        VStack {
            Color.yellow.frame(height: 44)
            
            HStack {
                DemoList()
                    .border(Color.gray, width: 2)
                DemoList()
                    .border(Color.gray, width: 2)
            }
            HStack {
                DemoList()
                    .border(Color.gray, width: 2)
                DemoList()
                    .border(Color.gray, width: 2)
            }
            
            Color.yellow.frame(height: 44)
        }
        .navigationBarTitle("Mutiple List", displayMode: .inline)
    }
}

struct MutipleListView_Previews: PreviewProvider {
    static var previews: some View {
        MutipleListView()
    }
}
