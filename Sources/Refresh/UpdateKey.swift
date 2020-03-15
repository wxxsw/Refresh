//
//  UpdateKey.swift
//  Refresh
//
//  Created by Gesen on 2020/3/8.
//  https://github.com/wxxsw/Refresh

import SwiftUI

@available(iOS 13.0, *)
extension EnvironmentValues {
    
    var refreshHeaderUpdate: Refresh.HeaderUpdate {
        get { self[Refresh.HeaderUpdate.Key.self] }
        set { self[Refresh.HeaderUpdate.Key.self] = newValue }
    }
    
    var refreshFooterUpdate: Refresh.FooterUpdate {
        get { self[Refresh.FooterUpdate.Key.self] }
        set { self[Refresh.FooterUpdate.Key.self] = newValue }
    }
}

@available(iOS 13.0, *)
extension Refresh {

    struct HeaderUpdate {
        let enable: Bool
        var progress: CGFloat = 0
        var refreshing: Bool = false
    }
    
    struct FooterUpdate {
        let enable: Bool
        var refreshing: Bool = false
    }
}

@available(iOS 13.0, *)
extension Refresh.HeaderUpdate {
    
    struct Key: EnvironmentKey {
        static var defaultValue: Refresh.HeaderUpdate = .init(enable: false)
    }
}

@available(iOS 13.0, *)
extension Refresh.FooterUpdate {
    
    struct Key: EnvironmentKey {
        static var defaultValue: Refresh.FooterUpdate = .init(enable: false)
    }
}
