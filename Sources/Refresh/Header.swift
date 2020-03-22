//
//  Header.swift
//  Refresh
//
//  Created by Gesen on 2020/3/7.
//  https://github.com/wxxsw/Refresh

import SwiftUI

@available(iOS 13.0, *)
extension Refresh {
    
    public struct Header<Label> where Label: View {
        
        let action: () -> Void
        let label: (CGFloat) -> Label
        
        @Binding var refreshing: Bool

        public init(refreshing: Binding<Bool>, action: @escaping () -> Void, @ViewBuilder label: @escaping (CGFloat) -> Label) {
            self.action = action
            self.label = label
            self._refreshing = refreshing
        }
        
        @Environment(\.refreshHeaderUpdate) var update
    }
}

@available(iOS 13.0, *)
extension Refresh.Header: View {
    
    public var body: some View {
        if update.refresh, !refreshing, update.progress > 1 {
            DispatchQueue.main.async {
                self.refreshing = true
                self.action()
            }
        }
        
        return Group {
            if update.enable {
                VStack(alignment: .center, spacing: 0) {
                    Spacer()
                    label(update.progress)
                        .opacity(opacity)
                }
                .frame(maxWidth: .infinity)
            } else {
                EmptyView()
            }
        }
        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        .anchorPreference(key: Refresh.HeaderAnchorKey.self, value: .bounds) {
            [.init(bounds: $0, refreshing: self.refreshing)]
        }
    }
    
    var opacity: Double {
        (!refreshing && update.refresh) || (update.progress == 0) ? 0 : 1
    }
}
