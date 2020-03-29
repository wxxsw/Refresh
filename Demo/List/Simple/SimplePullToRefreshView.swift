//
//  DemoPullToRefreshView.swift
//  Demo
//
//  Created by Gesen on 2020/3/21.
//

import SwiftUI

struct SimplePullToRefreshView: View {
    let progress: CGFloat
    
    var body: some View {
        Text("Pull to refresh")
    }
}

struct SimplePullToRefreshView_Previews: PreviewProvider {
    static var previews: some View {
        SimplePullToRefreshView(progress: 0)
    }
}
