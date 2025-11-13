import Foundation
import SwiftUI

/// A protocol defining navigation behaviors for managing a SwiftUI `NavigationPath`.
/// Conforming types can push and pop navigation elements to control navigation state.
public protocol NavigationCoordinator {
    /// Pushes a new element onto the navigation path.
    /// - Parameter path: A value conforming to `Hashable` representing the destination to navigate to.
    func push(_ path: any Hashable)
    
    /// Pops the last element from the navigation path.
    func popLast()
}
