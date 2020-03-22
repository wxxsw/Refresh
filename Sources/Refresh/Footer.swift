//
//  Footer.swift
//  Refresh
//
//  Created by Gesen on 2020/3/7.
//  https://github.com/wxxsw/Refresh

import SwiftUI

@available(iOS 13.0, *)
extension Refresh {
    
    public struct Footer<Label> where Label: View {
        
        let action: () -> Void
        let label: () -> Label
        
        @Binding var refreshing: Bool
        
        private var noMore: Bool = false
        private var preloadOffset: CGFloat = 0

        public init(refreshing: Binding<Bool>, action: @escaping () -> Void, @ViewBuilder label: @escaping () -> Label) {
            self.action = action
            self.label = label
            self._refreshing = refreshing
        }
        
        @Environment(\.refreshFooterUpdate) var update
    }
}

@available(iOS 13.0, *)
extension Refresh.Footer {
    
    public func noMore(_ noMore: Bool) -> Self {
        var view = self
        view.noMore = noMore
        return view
    }
    
    public func preload(offset: CGFloat) -> Self {
        var view = self
        view.preloadOffset = offset
        return view
    }
}

@available(iOS 13.0, *)
extension Refresh.Footer: View {
    
    public var body: some View {
        if !noMore, update.refresh, !refreshing {
            DispatchQueue.main.async {
                self.refreshing = true
                self.action()
            }
        }
        
        return Group {
            if update.enable {
                VStack(alignment: .center, spacing: 0) {
                    if refreshing || noMore {
                        label()
                    } else {
                        EmptyView()
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            } else {
                EmptyView()
            }
        }
        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        .anchorPreference(key: Refresh.FooterAnchorKey.self, value: .bounds) {
            if self.noMore || self.refreshing {
                return []
            } else {
                return [.init(bounds: $0, preloadOffset: self.preloadOffset, refreshing: self.refreshing)]
            }
        }
    }
}
