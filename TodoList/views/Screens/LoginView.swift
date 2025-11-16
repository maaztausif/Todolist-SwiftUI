//
//  LoginView.swift
//  TodoList
//
//  Created by Maaz Bin Tausif on 13.11.25.
//

import SwiftUI

struct LoginView: View {
    let screen = UIScreen.main.bounds
    @StateObject var viewModel: LoginViewModel
    @State private var password: String = ""
    @State private var email: String = ""
    
    var body: some View {
        ZStack{
            Background()
            VStack{
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120,height: 120)
                    .cornerRadius(20)
                    .padding(screen.height*0.09)
                
                
                CustomTextField(title: "Email", text: $viewModel.email,placeholder: "Enter    Email", leadingImage: Image(systemName: "envelope"))
                    .padding(.leading,20)
                    .padding(.trailing,20)
                
                CustomTextField(
                    title: "Password",
                    text: $viewModel.password,
                    placeholder: "Enter password",
                    validationMessage: "Invalid password",
                    trailingImage: Image(systemName: "envelope"),
                    trailingAction: {
                        // Example action: toggle secure text entry
//                        isSecure.toggle()
                    },
                    isSecure: true
                )
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,20)
                
                HStack{
                    
                }
                CheckBox(isChecked: .constant(true), title: "Remember me")
                    .padding(.leading,20)
                PrimaryButton(title: "Login") {
                    print(viewModel.validate())
                    print("Login")
                }
                .padding(10)
                Spacer()

            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LoginView(
        viewModel: .init(
            navigator: MockNavigationCoordinator(),
            text: "Test"
        )
    )
}
