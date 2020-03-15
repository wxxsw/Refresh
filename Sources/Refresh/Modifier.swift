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
        
        @State private var headerUpdate: HeaderUpdate
        @State private var headerPadding: CGFloat = 0
        @State private var headerPreviousProgress: CGFloat = 0
        
        @State private var footerUpdate: FooterUpdate
        @State private var footerPadding: CGFloat = 0
        
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
        GeometryReader { proxy in
            content
                .environment(\.refreshHeaderUpdate, self.headerUpdate)
                .environment(\.refreshFooterUpdate, self.footerUpdate)
//                .animation(nil)
                .padding(.top, self.headerPadding)
                .padding(.bottom, self.footerPadding)
//                .animation(.easeOut)
                .clipped()
                .backgroundPreferenceValue(Refresh.Key.self) { value -> Color in
                    DispatchQueue.main.async {
                        self.update(proxy: proxy, value: value)
                    }
                    return Color.clear
                }
        }
    }
    
    func update(proxy: GeometryProxy, value: Refresh.Key.Value) {
        for (k, v) in value {
            let rect = proxy[v.bounds]
            let padding = -max(rowHeight, rect.height)
            
            switch k {
            case .header:
                let progress = rect.maxY / rect.height
                var update = headerUpdate
                
                update.progress = progress
                
                if update.refreshing != v.refreshing {
                    update.refreshing = v.refreshing
                } else {
                    update.refreshing = update.refreshing || (headerPreviousProgress > 1 && progress < headerPreviousProgress && progress >= 1)
                }
                
                headerUpdate = update
                headerPadding = update.refreshing ? 0 : padding
                headerPreviousProgress = progress
                
            case .footer:
                var update = footerUpdate
                
                update.refreshing = false
                
                footerUpdate = update
                footerPadding = -max(rowHeight, rect.height)
            }
        }
    }
}
