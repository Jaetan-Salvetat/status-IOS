//
//  SplashScreen.swift
//  Status
//
//  Created by Gaetan Salvi on 15/02/2023.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        VStack(alignment: .center) {
            Image("StatusLogo")
                .resizable()
                .scaledToFit()
                .padding([.bottom], 35)
                .padding([.top], 75)
                .frame(width: 192)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("PrimaryColor"))
        .statusBarHidden()
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
