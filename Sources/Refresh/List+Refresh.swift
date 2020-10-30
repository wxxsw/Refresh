//
//  List+Refresh.swift
//  Refresh
//
//  Created by Gesen on 2020/3/7.
//  https://github.com/wxxsw/Refresh

import SwiftUI

@available(iOS 13.0, *)
extension ScrollView {
    
    public func enableRefresh(_ enable: Bool = true) -> some View {
        modifier(Refresh.Modifier(enable: enable))
    }
}
