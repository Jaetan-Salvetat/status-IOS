//
//  StateViewModel.swift
//  Status
//
//  Created by Gaetan Salvi on 15/02/2023.
//

import Foundation

class StateViewModel: ObservableObject {
    @Published var isSessionRequestReceived = false
    
    init() {
        Task {
            let isLogged = await Status.authRepository.validateSession()
            DispatchQueue.main.async {
                self.isSessionRequestReceived = true
            }
        }
    }
}
