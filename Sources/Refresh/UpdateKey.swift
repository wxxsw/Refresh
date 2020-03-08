//
//  UpdateKey.swift
//  Refresh
//
//  Created by Gesen on 2020/3/8.
//  https://github.com/wxxsw/Refresh

import SwiftUI

@available(iOS 13.0, *)
extension EnvironmentValues {
    
    var refreshHeaderUpdate: Refresh.Update {
        get { self[Refresh.Update.HeaderKey.self] }
        set { self[Refresh.Update.HeaderKey.self] = newValue }
    }
    
    var refreshFooterUpdate: Refresh.Update {
        get { self[Refresh.Update.FooterKey.self] }
        set { self[Refresh.Update.FooterKey.self] = newValue }
    }
}

@available(iOS 13.0, *)
extension Refresh {

    struct Update {
        let enable: Bool
        var progress: CGFloat?
        var refreshing: Bool = false
    }
}

@available(iOS 13.0, *)
extension Refresh.Update {
    
    struct HeaderKey: EnvironmentKey {
        static var defaultValue: Refresh.Update = .init(enable: false)
    }
    
    struct FooterKey: EnvironmentKey {
        static var defaultValue: Refresh.Update = .init(enable: false)
    }
}
