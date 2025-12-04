//
//  SwiftUIView.swift
//  TodoList
//
//  Created by Maaz Bin Tausif on 12.11.25.
//

import SwiftUI

struct SplashPage: View {
    let screen = UIScreen.main.bounds
    
    @ObservedObject var viewModel: SplashViewModel

    
    var body: some View {
        ZStack{
            Background()
            VStack{
                Spacer()
                Image("logo")
                    .resizable()
                       .scaledToFit()
                       .frame(width: 120, height: 120)
                       .cornerRadius(12)
                Spacer()
                VStack{
                    PrimaryButton(title: "Get Started") {
                        viewModel.nextButtonSelected()
                        print("button clicked")
                            
                    }
                    .padding(.horizontal,20)
                    .padding(.bottom,screen.height*0.05)
                    
                }
            }
        }
        .ignoresSafeArea()
     
    }
}

#Preview {
    SplashPage(
        viewModel: .init(
            navigator: MockNavigationCoordinator(),
            text: "Test"
        )
    )
}
