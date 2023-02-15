//
//  HttpService.swift
//  Status
//
//  Created by Gaetan Salvi on 12/02/2023.
//

import Foundation

class HttpService {
    func get<T: Decodable>(path: String, callback: @escaping (T?, Int) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
        var request = URLRequest(url: url)
        print("login...")
        request.httpMethod = "GET"

        let dataTask = URLSession.shared.dataTask(with: request) { data, response, _ in
            let code = (response as? HTTPURLResponse)?.statusCode ?? 0
            if let data = data {
                let body = try? JSONDecoder().decode(T.self, from: data)
                return callback(body, code)
            }
            callback(nil, code)
        }
        dataTask.resume()
    }
}

enum HttpResponse {
    case success
    case error
    
    // Authenticatetion
    case badCredentials
    case emailAlreadyInUse
    case usernameAlreadyInUse
}
