//
//  SimpleRefreshingView.swift
//  Demo
//
//  Created by Gesen on 2020/3/21.
//

import SwiftUI

struct SimpleRefreshingView: View {
    var body: some View {
        ActivityIndicator(style: .medium)
    }
}

struct SimpleRefreshingView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleRefreshingView()
    }
}
