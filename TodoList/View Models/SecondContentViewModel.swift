//
//  SecondContentViewModel.swift
//  TodoList
//
//  Created by Maaz Bin Tausif on 13.11.25.
//


import Foundation
import Combine

public final class LoginViewModel: ObservableObject {

    // MARK: - Properties

    @Published public var text: String
    private let navigator: NavigationCoordinator

    // MARK: - Lifecycle

    init(navigator: NavigationCoordinator, text: String) {
        self.navigator = navigator
        self.text = text
    }

}

// MARK: - Public

public extension LoginViewModel {

    func nextButtonSelected() {
//        self.navigator.push(
//            RootViewModel.Path.third(
//                .init(navigator: navigator, text: "Third!")
//            )
//        )
    }

    func backButtonSelected() {
        self.navigator.popLast()
    }

}

// MARK: - Hashable

extension LoginViewModel: Hashable {

    public static func == (lhs: LoginViewModel, rhs: LoginViewModel) -> Bool {
        return lhs.text == rhs.text
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.text)
    }
    
    
}
