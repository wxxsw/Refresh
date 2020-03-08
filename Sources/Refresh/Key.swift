//
//  Key.swift
//  Refresh
//
//  Created by Gesen on 2020/3/8.
//  https://github.com/wxxsw/Refresh

import SwiftUI

@available(iOS 13.0, *)
extension Refresh {
    
    struct Key: PreferenceKey {

        static var defaultValue: Value = [:]
        
        static func reduce(value: inout Value, nextValue: () -> Value) {
            value.merge(nextValue(), uniquingKeysWith: { $1 })
        }
        
        typealias Value = [K: V]
    }
}

@available(iOS 13.0, *)
extension Refresh.Key {

    enum Position: String {
        case header
        case footer
    }
    
    struct Values {
        let bounds: Anchor<CGRect>
        let refreshing: Bool
    }

    typealias K = Position
    typealias V = Values
}
