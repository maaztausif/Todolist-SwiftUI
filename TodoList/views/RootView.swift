//
//  RootView.swift
//  TodoList
//
//  Created by Maaz Bin Tausif on 13.11.25.
//

import Foundation
import SwiftUI
import Combine

@available(iOS 16.0, *)
struct RootView: View {

    @StateObject private var viewModel: RootViewModel

    init(viewModel: RootViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationStack(path: $viewModel.paths) {
            SplashPage(viewModel: viewModel.splashVM)
                .navigationDestination(for: RootViewModel.Path.self) { path in
                    switch path {
                    case .second:
                        LoginView(viewModel: viewModel.loginVM)
                    }
                }
        }
    }
}
g
