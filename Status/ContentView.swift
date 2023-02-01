//
//  ContentView.swift
//  Status
//
//  Created by Gaetan Salvi on 27/01/2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage(Status.tokenKey) private var token = ""

    var body: some View {
        AuthView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
