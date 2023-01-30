//
//  AuthView.swift
//  Status
//
//  Created by Gaetan Salvi on 27/01/2023.
//

import SwiftUI

struct AuthView: View {
    @ObservedObject var viewModel = AuthViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image("StatusLogo")
                    .resizable()
                    .scaledToFit()
                    .padding([.bottom], 35)
                    .padding([.top], 75)
                    .frame(width: 75)
                Spacer()
            }
            
            if viewModel.currentScreen == .register {
                RegisterView(viewModel: viewModel)
            } else {
                LoginView(viewModel: viewModel)
            }
            
            Spacer()
        }.padding(EdgeInsets(top: 0, leading: 48, bottom: 0, trailing: 48))
    }
}

struct AuthButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer()
            configuration.label.foregroundColor(.white)
            Spacer()
        }
        .padding()
        .background(Color.darkBlue.cornerRadius(8))
        .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
