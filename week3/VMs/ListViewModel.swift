//
//  ListViewModel.swift
//  week3
//
//  Created by Poter Pan on 2023/3/14.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveData()
        }
    }
    
    let itemsKey = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
//        let presetItems = [
//            ItemModel(title: "CPE", isCompleted: false),
//            ItemModel(title: "專題", isCompleted: false),
//            ItemModel(title: "開會", isCompleted: true)
//        ]
//        items.append(contentsOf: presetItems)
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    func removeItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    func moveItems(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        
        // 回傳第一個符合條件的成員在 array 裡的編號。

//        if let index = items.firstIndex { existingItem in
//            return existingItem.id == item.id
//        } {
//            // run this code
//        }
        
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            
            // items[index] = ItemModel(title: item.title, isCompleted: !item.isCompleted)
            // 這麼做是新增一個ItemModel物件來取代舊的(id 不同)
            // 但理論上我們應該直接由 ItemModel 內編輯該項目 如此也符合MVVM的理論
            items[index] = item.updateCompletion()
            
        }
        
    }
    
    func saveData() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
}
