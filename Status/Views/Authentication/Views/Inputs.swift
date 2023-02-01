//
//  Inputs.swift
//  Status
//
//  Created by Gaetan Salvi on 28/01/2023.
//

import SwiftUI

struct Input: View {
    @State var value: String
    var title: String
    var errorMassage: String?

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(Color.darkGray)
                .fontWeight(Font.Weight.medium)

            HStack {
                TextField("", text: $value)
                    .frame(height: 32)
                    .padding([.leading, .trailing], 7)
            }
            .background(Color.lightGray)
            .cornerRadius(8)
        }
    }
}

struct SecureInput: View {
    @State var value: String
    @State var showPassword = false

    var body: some View {
        VStack(alignment: .leading) {
            Text("Mot de passe")
                .foregroundColor(Color.darkGray)
                .fontWeight(Font.Weight.medium)

            HStack {
                if showPassword {
                    TextField("", text: $value)
                        .padding([.leading], 7)
                } else {
                    SecureField("", text: $value)
                        .padding([.leading], 7)
                }
                Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                    .padding([.trailing], 7)
                    .foregroundColor(Color.darkGray)
                    .onTapGesture {
                        showPassword = !showPassword
                    }
            }
            .frame(height: 32)
            .background(Color.lightGray)
            .cornerRadius(8)
        }
    }
}

struct DateInput: View {
    @ObservedObject var viewModel: AuthViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("Date de naissance")
                .foregroundColor(Color.darkGray)
                .fontWeight(Font.Weight.medium)

            HStack {
                DropDown(
                    title: "Jour",
                    value: viewModel.birthdayDay,
                    items: viewModel.getDays(),
                    onChange: {
                        viewModel.birthdayDay = $0
                    }
                )
                Spacer()
                DropDown(
                    title: "Mois",
                    value: viewModel.birthdayMonth,
                    items: viewModel.getMonths(),
                    onChange: {
                        viewModel.birthdayMonth = $0
                    }
                )
                Spacer()
                DropDown(
                    title: "Année",
                    value: viewModel.birthdayYear,
                    items: viewModel.getYears(),
                    onChange: {
                        viewModel.birthdayYear = $0
                    }
                )
            }
        }
    }
}

private struct DropDown: View {
    var title: String
    var value: String
    var items: [String]
    var onChange: (String) -> Void

    var body: some View {
        Menu {
            ForEach(items, id: \.self) { text in
                Button(text) { onChange(text) }
            }
        } label: {
            HStack {
                HStack {
                    Text(value.isEmpty ? title : value)
                    Spacer()
                    Image("KeyboardArrowDown")
                }.padding([.leading, .top, .trailing, .bottom], 7)
            }
            .frame(width: 92, height: 32)
            .background(Color.lightGray)
            .cornerRadius(8)
        }
        .foregroundColor(Color.darkGray)
    }
}
