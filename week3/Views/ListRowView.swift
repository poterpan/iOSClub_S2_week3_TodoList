//
//  ListRowView.swift
//  week3
//
//  Created by Poter Pan on 2023/3/13.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical,15)
        .background(item.isCompleted ? .white : Color.orange.opacity(0.2))
    }
}


struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "123", isCompleted: true)
    static var item2 = ItemModel(title: "aaa", isCompleted: false)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)

        }
        .previewLayout(.sizeThatFits)
    }
}
