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
            
            Input(value: viewModel.email, title: "E-mail")
                .padding([.bottom], 22)
            SecureInput(value: viewModel.password)
                .padding([.bottom], 22)
            
            Button("S'inscrire") {}
                .padding([.top, .bottom], 15)
                .buttonStyle(AuthButtonStyle())
            
            HStack {
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: AuthViewModel())
    }
}
