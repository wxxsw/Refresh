//
//  Modifier.swift
//  Refresh
//
//  Created by Gesen on 2020/3/8.
//  https://github.com/wxxsw/Refresh

import SwiftUI

@available(iOS 13.0, *)
extension Refresh {
    
    struct Modifier {
        let isEnabled: Bool
        
        @State private var id: Int = 0
        @State private var headerUpdate: HeaderUpdateKey.Value
        @State private var headerPadding: CGFloat = 0
        @State private var headerPreviousProgress: CGFloat = 0
        
        @State private var footerUpdate: FooterUpdateKey.Value
        @State private var footerPreviousRefreshAt: Date?
        
        init(enable: Bool) {
            isEnabled = enable
            _headerUpdate = State(initialValue: .init(enable: enable))
            _footerUpdate = State(initialValue: .init(enable: enable))
        }
        
        @Environment(\.defaultMinListRowHeight) var rowHeight
    }
}

@available(iOS 13.0, *)
extension Refresh.Modifier: ViewModifier {
    
    func body(content: Content) -> some View {
        return GeometryReader { proxy in
            content
                .environment(\.refreshHeaderUpdate, self.headerUpdate)
                .environment(\.refreshFooterUpdate, self.footerUpdate)
                .padding(.top, self.headerPadding)
                .clipped(proxy.safeAreaInsets == .zero)
                .backgroundPreferenceValue(Refresh.HeaderAnchorKey.self) { v -> Color in
                    DispatchQueue.main.async { self.update(proxy: proxy, value: v) }
                    return Color.clear
                }
                .backgroundPreferenceValue(Refresh.FooterAnchorKey.self) { v -> Color in
                    DispatchQueue.main.async { self.update(proxy: proxy, value: v) }
                    return Color.clear
                }
                .id(self.id)
        }
    }
    
    func update(proxy: GeometryProxy, value: Refresh.HeaderAnchorKey.Value) {
        guard let item = value.first else { return }
        guard !footerUpdate.refresh else { return }
        
        let bounds = proxy[item.bounds]
        var update = headerUpdate
        
        update.progress = max(0, (bounds.maxY) / bounds.height)
        
        if update.refresh != item.refreshing {
            update.refresh = item.refreshing
            
            if !item.refreshing {
                id += 1
                DispatchQueue.main.async {
                    self.headerUpdate.progress = 0
                }
            }
        } else {
            update.refresh = update.refresh || (headerPreviousProgress > 1 && update.progress < headerPreviousProgress && update.progress >= 1)
        }
        
        headerUpdate = update
        headerPadding = headerUpdate.refresh ? 0 : -max(rowHeight, bounds.height)
        headerPreviousProgress = update.progress
    }
    
    func update(proxy: GeometryProxy, value: Refresh.FooterAnchorKey.Value) {
        guard let item = value.first else { return }
        guard headerUpdate.progress == 0 else { return }
        
        let bounds = proxy[item.bounds]
        var update = footerUpdate
        
        if bounds.minY <= rowHeight || bounds.minY <= bounds.height {
            update.refresh = false
        } else if update.refresh && !item.refreshing {
            update.refresh = false
        } else {
            update.refresh = proxy.size.height - bounds.minY + item.preloadOffset > 0
        }
        
        if update.refresh, !footerUpdate.refresh {
            if let date = footerPreviousRefreshAt, Date().timeIntervalSince(date) < 0.1 {
                update.refresh = false
            }
            footerPreviousRefreshAt = Date()
        }
        
        footerUpdate = update
    }
}
