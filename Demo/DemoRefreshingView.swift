//
//  DemoRefreshingView.swift
//  Demo
//
//  Created by Gesen on 2020/3/21.
//

import SwiftUI

struct DemoRefreshingView: View {
    var body: some View {
        ActivityIndicatorView(style: .medium)
    }
}

struct DemoRefreshingView_Previews: PreviewProvider {
    static var previews: some View {
        DemoRefreshingView()
    }
}

struct ActivityIndicatorView: UIViewRepresentable {
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: Context) -> UIActivityIndicatorView  {
        return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        uiView.startAnimating()
    }
}
