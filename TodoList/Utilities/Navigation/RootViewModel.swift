//
//  RootViewController.swift
//  TodoList
//
//  Created by Maaz Bin Tausif on 13.11.25.
//

import Foundation
import SwiftUI
import Combine

@available(iOS 16.0, *)
public class RootViewModel: ObservableObject, Identifiable {

    // MARK: - Types

    public enum Path: Hashable {
        case first(SplashViewModel)
        case second(LoginViewModel)
    }

    // MARK: - Properties

    public var id = UUID()

    /// The object that handles our navigation stack
    @Published public var paths = NavigationPath()

    /// The ViewModel that represents our first view in the navigation stack
    public lazy var firstContentViewModel: LoginViewModel = {
        .init(navigator: self, text: "First!")
    }()

}

// MARK: - NavigationCoordinator

@available(iOS 16.0, *)
extension RootViewModel: NavigationCoordinator {

    public func push(_ path: any Hashable) {
        DispatchQueue.main.async { [weak self] in
            self?.paths.append(path)
        }
    }

    public func popLast() {
        DispatchQueue.main.async { [weak self] in
            self?.paths.removeLast()
        }
    }

}

// MARK: - Preview Mock

@available(iOS 16.0, *)
public extension RootViewModel {

    static var mock: RootViewModel {
        .init()
    }

}

