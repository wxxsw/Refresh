//
//  DemoCell.swift
//  Demo
//
//  Created by Gesen on 2020/3/21.
//

import SwiftUI

struct DemoCell: View {
    let item: DemoList.Item
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            item.color
                .frame(width: 60, height: 60)
                .cornerRadius(8)
            
            VStack(spacing: 8) {
                item.color
                    .frame(height: 30)
                    .cornerRadius(4)
                
                item.color
                    .frame(height: item.contentHeight)
                    .cornerRadius(4)
            }
        }
        .padding(.top)
    }
}

struct DemoCell_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ForEach(DemoList.generateItems(count: 4)) { item in
                DemoCell(item: item)
            }
        }
        .previewLayout(.sizeThatFits)
    }
}
