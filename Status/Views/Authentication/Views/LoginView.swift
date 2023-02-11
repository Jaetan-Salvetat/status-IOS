//
//  LoginView.swift
//  Status
//
//  Created by Gaetan Salvi on 28/01/2023.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: AuthViewModel

    var body: some View {
        VStack {
            Text("Connectez-vous à Status")
                .font(.system(size: 24, weight: .bold))
                .padding([.bottom], 35)

            Input(
                value: $viewModel.email,
                title: "E-mail",
                errorMessage: viewModel.inputErrors.contains(.email)
                    ? "l'email n'est pas au bon format."
                    : ""
            ).padding([.bottom], 22)
            
            SecureInput(
                value: $viewModel.password,
                isInError: viewModel.inputErrors.contains(.password)
            ).padding([.bottom], 22)

            HStack {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    Button("Se connecter") { viewModel.validForm() }
                }
            }
            .padding([.top, .bottom], 15)
            .buttonStyle(AuthButtonStyle())

            HStack {
                if !viewModel.isLoading {
                    Text("Vous n’avez pas de compte ?")
                        .font(.system(size: 12))
                    Text("Inscrivez-vous")
                        .font(.system(size: 12))
                        .underline()
                        .onTapGesture {
                            viewModel.navigate()
                        }
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: AuthViewModel())
    }
}
