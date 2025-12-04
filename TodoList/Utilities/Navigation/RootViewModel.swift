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
        case second  // value type only
    }

    // MARK: - Properties

    public var id = UUID()

    @Published public var paths = NavigationPath()

    // Create VMs normally
    public lazy var splashVM: SplashViewModel = {
        .init(navigator: self, text: "First!")
    }()

    public lazy var loginVM: LoginViewModel = {
        .init(navigator: self, text: "Second!")
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
