//
//  DemoList.swift
//  Demo
//
//  Created by Gesen on 2020/3/22.
//

import SwiftUI
import Refresh

struct DemoList: View {
    
    struct Item: Identifiable {
        let id = UUID()
        let color: Color
        let contentHeight: CGFloat
    }
    
    @State private var items: [Item] = []
    @State private var headerRefreshing: Bool = false
    @State private var footerRefreshing: Bool = false
    @State private var noMore: Bool = false
    
    var body: some View {
        List {
            if items.count > 0 {
                RefreshHeader(refreshing: $headerRefreshing, action: {
                    self.reload()
                }) { progress in
                    if self.headerRefreshing {
                        DemoRefreshingView()
                    } else {
                        DemoPullToRefreshView(progress: progress)
                    }
                }
            }
            
            ForEach(items) { item in
                DemoCell(item: item)
            }
             
            if items.count > 0 {
                RefreshFooter(refreshing: $footerRefreshing, action: {
                    self.loadMore()
                }) {
                    if self.noMore {
                        Text("No more data !")
                            .foregroundColor(.secondary)
                            .padding()
                    } else {
                        DemoRefreshingView()
                            .padding()
                    }
                }
                .noMore(noMore)
                .preload(offset: 50)
            }
        }
        .enableRefresh()
        .overlay(Group {
            if items.count == 0 {
                ActivityIndicatorView(style: .medium)
            } else {
                EmptyView()
            }
        })
        .onAppear { self.reload() }
    }
    
    func reload() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.items = DemoList.generateItems(count: 30)
            self.headerRefreshing = false
            self.noMore = false
        }
    }
    
    func loadMore() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.items += DemoList.generateItems(count: 20)
            self.footerRefreshing = false
            self.noMore = self.items.count > 50
        }
    }
}

extension DemoList {
    
    static func generateItems(count: Int) -> [Item] {
        (0 ..< count).map { _ in
            Item(
                color: Color(
                    red: Double.random(in: 0 ..< 255) / 255,
                    green: Double.random(in: 0 ..< 255) / 255,
                    blue: Double.random(in: 0 ..< 255) / 255
                ),
                contentHeight: CGFloat.random(in: 100 ..< 200)
            )
        }
    }
}
