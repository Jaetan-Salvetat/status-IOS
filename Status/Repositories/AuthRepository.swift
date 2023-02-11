//
//  AuthRepository.swift
//  Status
//
//  Created by Gaetan Salvi on 30/01/2023.
//

import Foundation
import SwiftUI

/*let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
var request = URLRequest(url: url)
print("login...")
request.httpMethod = "GET"

let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
    if let data = data {
        let myTask = try? JSONDecoder().decode(Task.self, from: data)
        print(myTask)
    }
    if error != nil {
        print(error!)
    }
}
dataTask.resume()*/

class AuthRepository {
     private let apiUri = Bundle.main.infoDictionary?["API_BASE_URL"] as? String // \(apiUri)/auth/login
    @AppStorage(Status.tokenKey) private var token = ""

    func login(_ email: String, _ password: String) async -> Int {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        token = "myToken"
        return 200
    }

    func register(_ email: String, _ username: String, _ password: String) async -> Int {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        token = "myToken"
        return 201
    }

    func validateSession() async -> Int {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        return 200
    }
}
