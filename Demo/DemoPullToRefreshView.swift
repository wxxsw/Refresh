//
//  DemoPullToRefreshView.swift
//  Demo
//
//  Created by Gesen on 2020/3/21.
//

import SwiftUI

struct DemoPullToRefreshView: View {
    let progress: CGFloat
    
    var body: some View {
        Text("Pull to refresh")
    }
}

struct DemoPullToRefreshView_Previews: PreviewProvider {
    static var previews: some View {
        DemoPullToRefreshView(progress: 0)
    }
}
