//
//  ContentView.swift
//  week3
//
//  Created by Poter Pan on 2023/3/12.
//

import SwiftUI

struct ListView: View {
    
    //    @State var items: [ItemModel] = [
    //        ItemModel(title: "CPE", isCompleted: false),
    //        ItemModel(title: "專題", isCompleted: false),
    //        ItemModel(title: "開會", isCompleted: true)
    //    ]
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    
    var body: some View {
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation {
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.removeItems)
            .onMove(perform: listViewModel.moveItems)
            
        }
        
        
        .listStyle(.plain)
        .navigationTitle("ToDo List")
        
        .toolbar {
            
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("add") {
                    AddView()
                }
            }
        }
        
        
    }
    
    // 移入ListVM
    //    func removeItems(at offsets: IndexSet) {
    //        items.remove(atOffsets: offsets)
    //    }
    
    //    func moveItems(from: IndexSet, to: Int) {
    //        items.move(fromOffsets: from, toOffset: to)
    //    }
    
}
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
                .environmentObject(ListViewModel())
        }
    }
}
