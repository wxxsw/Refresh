//
//  FooterKey.swift
//  Refresh
//
//  Created by Gesen on 2020/3/22.
//  https://github.com/wxxsw/Refresh

import SwiftUI

@available(iOS 13.0, *)
extension EnvironmentValues {
    
    var refreshFooterUpdate: Refresh.FooterUpdateKey.Value {
        get { self[Refresh.FooterUpdateKey.self] }
        set { self[Refresh.FooterUpdateKey.self] = newValue }
    }
}

@available(iOS 13.0, *)
extension Refresh {
    
    struct FooterAnchorKey {
        static var defaultValue: Value = []
    }
    
    struct FooterUpdateKey {
        static var defaultValue: Value = .init(enable: false)
    }
}

@available(iOS 13.0, *)
extension Refresh.FooterAnchorKey: PreferenceKey {
    
    typealias Value = [Item]
    
    struct Item {
        let bounds: Anchor<CGRect>
        let preloadOffset: CGFloat
        let refreshing: Bool
    }
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value.append(contentsOf: nextValue())
    }
}

@available(iOS 13.0, *)
extension Refresh.FooterUpdateKey: EnvironmentKey {
    
    struct Value: Equatable {
        let enable: Bool
        var refresh: Bool = false
    }
}
