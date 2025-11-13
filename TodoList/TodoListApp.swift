//
//  TodoListApp.swift
//  TodoList
//
//  Created by Maaz Bin Tausif on 12.11.25.
//

import SwiftUI

@main
struct TodoListApp: App {
    var body: some Scene {
        WindowGroup {
            if #available(iOS 16.0, *) {
                RootView(viewModel: .init())
            } else {
                // Fallback on earlier versions
            }
        }
    }
}
