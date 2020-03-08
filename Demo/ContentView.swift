//
//  ContentView.swift
//  Demo
//
//  Created by Gesen on 2020/2/29.
//

import SwiftUI
import Refresh

struct ContentView: View {
    @State private var count: Int = 30
    @State private var headerRefreshing: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            Color.blue
                .frame(height: 100)
            
            List {
                RefreshHeader(refreshing: $headerRefreshing, action: {
                    self.reload()
                }) { progress in
                    Text("pulling \(progress)")
                }

                ForEach(0 ..< self.count) { i in
                    Text("\(i)")
                }
                
                RefreshFooter(
                    loading: { Text("loading...") },
                    loadAction: { self.loadMore() }
                )
            }
            .enableRefresh()
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
    func reload() {
        print("reload")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.count = 30
            self.headerRefreshing = false
            print("reload finish")
        }
    }
    
    func loadMore() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.count += 30
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
