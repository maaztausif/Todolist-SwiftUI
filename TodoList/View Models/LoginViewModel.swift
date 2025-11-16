//
//  SecondContentViewModel.swift
//  TodoList
//
//  Created by Maaz Bin Tausif on 13.11.25.
//


import Foundation
import Combine

public final class LoginViewModel: ObservableObject {
    
    @Published var email:String = ""
    @Published var password:String = ""
    @Published var isCheck:Bool = false
    
    @Published var emailError:String = ""
    @Published var passwordError:String = ""
    
    let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#

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
    
    func validate()->(Bool,String){
        if email.isEmpty{
            emailError = "Email is empty"
            return (false,emailError)
        }else if !isValidEmail(email){
            emailError = "Invalid email format"
            return (false,emailError)

        }
        
        else if password.isEmpty{
            passwordError = "password is empty"
            return (false,passwordError)

        }else if password.count > 7{
            passwordError = "password too short"
            return (false,passwordError)

        }else{
            passwordError = ""
            return (true,"")

        }
        
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
