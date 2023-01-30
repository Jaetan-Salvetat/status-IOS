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
    @Published var birthdayDay = ""
    @Published var birthdayMonth = ""
    @Published var birthdayYear = ""
    @Published var currentScreen = AuthScreen.register
    
    
    func navigate() {
        email = ""
        password = ""
        birthdayDay = ""
        birthdayMonth = ""
        birthdayYear = ""
        currentScreen = currentScreen == .register ? .login : .register
    }
    
    
    func getDays() -> [String] {
        var days: [String] = []
        
        for day in 1...31 {
            days.append(String(day))
        }
        
        return days
    }
    
    func getMonths() -> [String] {
        return ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novrembre", "Décembre"]
    }
    
    func getYears() -> [String] {
        let maxYear = Calendar.current.component(.year, from: Date.now)
        let minYear = maxYear - 100
        var years: [String] = []
        
        for year in minYear...maxYear {
            years.append(String(year))
        }
        
        return years.reversed()
    }
}

enum AuthScreen {
    case register
    case login
}
