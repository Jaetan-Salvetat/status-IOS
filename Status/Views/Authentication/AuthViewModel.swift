//
//  AuthViewModel.swift
//  Status
//
//  Created by Gaetan Salvi on 27/01/2023.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published var email = ""
    @Published var username = ""
    @Published var password = ""
    @Published var birthday = Date.getMaxDateFromBirthday()
    @Published var currentScreen = AuthScreen.register
    @Published var inputErrors: [InputErrorType] = []
    @Published var isLoading = false

    func getBurthdayDateRange() -> ClosedRange<Date> {
        let minDate = Date.getMinDateFromBirthday()
        let maxDate = Date.getMaxDateFromBirthday()
        
        return minDate...maxDate
    }

    func navigate() {
        email = ""
        password = ""
        birthday = Date()
        inputErrors = []
        currentScreen = currentScreen == .register ? .login : .register
    }
    
    func validForm() {
        if !isInputsValid() { return }
        isLoading = true

        print(currentScreen)
        Task(priority: .background) {
            if currentScreen == AuthScreen.login {
                let response = await Status.authRepository.login(email, password)
                print("login: \(response)")
            } else {
                let response = await Status.authRepository.register(email, username, password)
                print("register: \(response)")
            }
            
            DispatchQueue.main.async {
                self.isLoading = false
            }
        }
    }
    
    private func isInputsValid() -> Bool {
        inputErrors = []
        if !email.isEmail() {
            inputErrors.append(.email)
        }
        if !username.isUsername() && currentScreen == AuthScreen.register {
            inputErrors.append(.username)
        }
        if !password.isPassword() {
            inputErrors.append(.password)
        }
        return inputErrors.isEmpty
    }
}

enum AuthScreen {
    case register
    case login
}

enum InputErrorType {
    case email
    case password
    case username
}
