//
//  ContentView.swift
//  Demo
//
//  Created by Gesen on 2020/2/29.
//

import SwiftUI
import Refresh

struct ContentView: View {
    var count = 30
    
    var body: some View {
        GeometryReader { proxy in
            List {
                Group {
                    Refresh(.top) { (isRefreshing, progress) in
                        Text("\(isRefreshing ? "true" : "false") \(progress)")
                    }
                    
                    ForEach(0 ..< self.count) { i in
                        Text("\(i)")
                            .frame(maxHeight: 0)
                    }
                    
                    Refresh(.bottom) { (isRefreshing, progress) in
                        Text("\(isRefreshing ? "true" : "false") \(progress)")
                    }
                }
                .preference(key: TestKey.self, value: [proxy.frame(in: .global)])
            }
        }
        .offset(y: -44)
        .onPreferenceChange(TestKey.self) { p in
            print(p)
        }
    }
}
struct TestKey: PreferenceKey {
    
    static var defaultValue: [CGRect] = []
    
    static func reduce(value: inout [CGRect], nextValue: () -> [CGRect]) {
        value.append(contentsOf: nextValue())
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
