//
//  ContentView.swift
//  Status
//
//  Created by Gaetan Salvi on 27/01/2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage(Status.tokenKey) var token = ""
    @ObservedObject var state = StateViewModel()

    var body: some View {
        if token.isNotEmpty() && state.isSessionRequestReceived {
            AppView()
        } else if token.isEmpty && state.isSessionRequestReceived {
            AuthView()
        } else {
            SplashScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
