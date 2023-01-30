//
//  AuthRepository.swift
//  Status
//
//  Created by Gaetan Salvi on 30/01/2023.
//

import Foundation

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
    func login() async -> Int {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        UserDefaults.standard.set("myToken", forKey: Status.TOKEN_KEY)
        return 200
    }

    func register() async -> Int {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        UserDefaults.standard.set("myToken", forKey: Status.TOKEN_KEY)
        return 201
    }

    func validateSession() async -> Int {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        UserDefaults.standard.set("myToken", forKey: Status.TOKEN_KEY)
        return 200
    }
}
