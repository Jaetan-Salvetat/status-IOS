//
//  HttpResponse.swift
//  Status
//
//  Created by Gaetan Salvi on 12/02/2023.
//

import Foundation

enum HttpResponse {
    case success
    case error
    
    // Authenticatetion
    case badCredentials
    case emailAlreadyInUse
    case usernameAlreadyInUse
}
