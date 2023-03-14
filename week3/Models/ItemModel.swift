//
//  ItemModel.swift
//  week3
//
//  Created by Poter Pan on 2023/3/13.
//

import Foundation

// Immutable Struct 不變的

struct ItemModel: Identifiable, Codable {
    
    internal init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
//    let id: String = UUID().uuidString
    let id: String
    let title: String
    let isCompleted: Bool
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
}
