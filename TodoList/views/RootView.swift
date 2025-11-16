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

    // MARK: - Properties

    @StateObject var viewModel: RootViewModel
    @State private var path = NavigationPath()

    // MARK: - View

    var body: some View {
        
        NavigationStack(path: $path) {
            SplashPage(viewModel: viewModel.firstContentViewModel)
                .navigationDestination(for: RootViewModel.Path.self) { path in
                    switch path {
                    case .first(let viewModel):
                        SplashPage(viewModel: viewModel)
//                    case .second(let viewModel):
//                        SecondContentView(viewModel: viewModel)
//                    case .third(let viewModel):
//                        ThirdContentView(viewModel: viewModel)
                    case .second(let viewModel):
                        LoginView(viewModel:viewModel)
                    }
                }
        }

    }
}

