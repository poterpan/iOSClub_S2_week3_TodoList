//
//  week3App.swift
//  week3
//
//  Created by Poter Pan on 2023/3/12.
//

import SwiftUI

@main
struct week3App: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
