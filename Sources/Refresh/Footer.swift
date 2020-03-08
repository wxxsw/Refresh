//
//  Footer.swift
//  Refresh
//
//  Created by Gesen on 2020/3/7.
//  https://github.com/wxxsw/Refresh

import SwiftUI

@available(iOS 13.0, *)
extension Refresh {
    
    public struct Footer<Loading> where Loading: View {
        
        let loading: () -> Loading
        let loadAction: () -> Void

        public init(@ViewBuilder loading: @escaping () -> Loading, loadAction: @escaping () -> Void) {
            self.loading = loading
            self.loadAction = loadAction
        }
    }
}

@available(iOS 13.0, *)
extension Refresh.Footer: View {
    
    public var body: some View {
        self.loading()
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .anchorPreference(key: Refresh.Key.self, value: .bounds) { [.footer: .init(bounds: $0, refreshing: false)] }
    }
}
