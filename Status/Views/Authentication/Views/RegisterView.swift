//
//  RegisterView.swift
//  Status
//
//  Created by Gaetan Salvi on 28/01/2023.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var viewModel: AuthViewModel

    var body: some View {
        VStack {
            Text("Rejoignez Status")
                .font(.system(size: 24, weight: .bold))
                .padding([.bottom], 35)

            Input(
                value: $viewModel.username,
                title: "Nom d’utilisateur",
                errorMessage: viewModel.inputErrors.contains(.username)
                    ? "le nom d'utilisateur ne peut pas être vide."
                    : ""
            ).padding([.bottom], 22)
            
            Input(
                value: $viewModel.email,
                title: "E-mail",
                errorMessage: viewModel.inputErrors.contains(.email)
                    ? "l'email n'est pas au bon format."
                    : ""
            ).padding([.bottom])
    
            SecureInput(
                value: $viewModel.password,
                isInError: viewModel.inputErrors.contains(.password)
            ).padding([.bottom], 22)
            
            DateInput(viewModel: viewModel)
                .padding([.bottom], 22)

            HStack {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    Button("S'inscrire") { viewModel.validForm() }
                }
            }
            .padding([.top, .bottom], 15)
            .buttonStyle(AuthButtonStyle())

            HStack {
                if !viewModel.isLoading {
                    Text("Vous avez déjà un compte ?")
                        .font(.system(size: 12))
                    Text("Connectez-vous")
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

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(viewModel: AuthViewModel())
    }
}
