//
//  SplashViewModel.swift
//  TodoList
//
//  Created by Maaz Bin Tausif on 13.11.25.
//

import Foundation
import Combine

public class SplashViewModel: ObservableObject {

    @Published public var text: String
    private let navigator: NavigationCoordinator

    init(navigator: NavigationCoordinator, text: String) {
        self.navigator = navigator
        self.text = text
    }

    func nextButtonSelected() {
        if #available(iOS 16.0, *) {
            navigator.push(RootViewModel.Path.second)
        }
    }
}


// MARK: - Hashable

extension SplashViewModel: Hashable {

    public static func == (lhs: SplashViewModel, rhs: SplashViewModel) -> Bool {
        return lhs.text == rhs.text
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.text)
    }
    
    
}

