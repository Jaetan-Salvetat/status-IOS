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
            
            Input(value: viewModel.username, title: "Nom d’utilisateur")
                .padding([.bottom], 22)
            Input(value: viewModel.email, title: "E-mail")
                .padding([.bottom], 22)
            SecureInput(value: viewModel.password)
                .padding([.bottom], 22)
            DateInput(viewModel: viewModel)
                .padding([.bottom], 22)
            
            Button("S'inscrire") {}
                .padding([.top, .bottom], 15)
                .buttonStyle(AuthButtonStyle())
            
            HStack {
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

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(viewModel: AuthViewModel())
    }
}
