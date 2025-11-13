//
//  MockNavigationCoordinator.swift
//  TodoList
//
//  Created by Maaz Bin Tausif on 13.11.25.
//

import Foundation

class MockNavigationCoordinator: NavigationCoordinator {

    // MARK: - Types

    typealias OnPush = (_ path: any Hashable) -> Void
    typealias OnPop = () -> Void

    let onPush: OnPush?
    let onPop: OnPop?

    // MARK: - Lifecycle

    init() {
        self.onPush = nil
        self.onPop = nil
    }

    init(onPush: @escaping OnPush, onPop: @escaping OnPop) {
        self.onPush = onPush
        self.onPop = onPop
    }

    // MARK: - NavigationCoordinator

    func push(_ path: any Hashable) {
        onPush?(path)
    }

    func popLast() {
        onPop?()
    }

}
