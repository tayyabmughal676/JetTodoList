//
//  ListRowView.swift
//  JetTodoList
//
//  Created by Thor on 13/07/2021.
//

import SwiftUI

struct ListRowView: View {
    
    let item: itemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle": "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = itemModel(title: "First Item", isCompleted: false)
    static var item2 = itemModel(title: "Second Item", isCompleted: true)
    static var previews: some View {
        Group{
            ListRowView(item: item1)
            ListRowView(item: item2)
        }.previewLayout(.sizeThatFits)
    }
    
}
