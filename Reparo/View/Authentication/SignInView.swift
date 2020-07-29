//
//  SignInView.swift
//  Reparo
//
//  Created by Antoine on 04/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var session: SessionStore
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @State var hasNoError: Bool = true
    
    func signIn() {
        session.signIn(email: email, password: password) { (_, error) in
            if let error = error {
                self.error = error.localizedDescription
                self.hasNoError = false
            } else {
                self.hasNoError = true
                self.email = ""
                self.password = ""
            }
        }
    }
    
    var body: some View {

        NavigationView {
            VStack {
                Text("Bonjour !")
                    .font(.system(size: 32, weight: .heavy, design: .rounded))

                Text("Si vous êtes déjà inscrit, veuillez entrer vos identifiants.")
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                
                VStack(spacing: 18) {
                    TextField("Adresse email", text: $email)
                        .textContentType(.emailAddress)
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                        .padding(12)
                        .background(RoundedRectangle(cornerRadius: 5).strokeBorder(lineWidth: 1))

                    SecureField("Mot de passe", text: $password)
                        .textContentType(.password)
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                        .padding(12)
                        .background(RoundedRectangle(cornerRadius: 5).strokeBorder(lineWidth: 1))
                }.padding(.vertical, 32)

                Button(action: signIn) {
                    Text("Sign in")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .bold, design: .rounded))
                        .background(Color.blue)
                        .cornerRadius(5)
                }

                if error != "" {
                    HStack {
                        AssembledCheckButton(isChecked: $hasNoError).frame(width: 20, height: 20)
                        Text(error)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.red)
                            .padding()
                    }
                }

                Spacer()

                NavigationLink(destination: SignUpView()) {
                    Text("Nouvel utilisateur ?")
                        .font(.system(size: 14, weight: .light))
                        .foregroundColor(.gray)
                    Text("Créer un compte")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.blue)
                }.padding()
            }.padding(.horizontal, 32)
        }
    }
}
