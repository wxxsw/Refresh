//
//  SimpleCell.swift
//  Demo
//
//  Created by Gesen on 2020/3/21.
//

import SwiftUI

struct SimpleCell: View {
    let item: SimpleList.Item
    
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

struct SimpleCell_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            ForEach(SimpleList.generateItems(count: 4)) { item in
                SimpleCell(item: item)
            }
        }
        .previewLayout(.sizeThatFits)
    }
}
