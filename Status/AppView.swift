//
//  App.swift
//  Status
//
//  Created by Gaetan Salvi on 11/02/2023.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        Button("Disconnect") {
            UserDefaults.standard.set("", forKey: Status.tokenKey)
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
