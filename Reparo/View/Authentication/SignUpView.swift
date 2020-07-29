//
//  SignUpView.swift
//  Reparo
//
//  Created by Antoine on 04/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    
    @EnvironmentObject var session: SessionStore
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var passwordConfirmation: String = ""
    @State var error: String = ""
    
    func signUp() {
        if password != passwordConfirmation {
            error = "Les mots de passe ne correspondent pas, veuillez les resaisir."
            return
        }
        session.signUp(email: email, password: password) { (result, error) in
            if let error = error {
                self.error = error.localizedDescription
            } else if let result = result, self.username != "" {
                DatabaseService.shared.createUser(uid: result.user.uid, username: self.username, email: self.email)
                self.email = ""
                self.password = ""
            }
        }
    }
    var body: some View {
        VStack {
            Text("Créer un compte")
                .font(.system(size: 32, weight: .heavy, design: .rounded))

            Text("Pour commencer, veuillez saisir une adresse email et un mot de passe.")
                .font(.system(size: 18, weight: .medium, design: .rounded))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            VStack(spacing: 18) {
                TextField("Nom d'utilisateur", text: $username)
                    .textContentType(.name)
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(lineWidth: 1))

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

                SecureField("Confirmation du mot de passe", text: $passwordConfirmation)
                    .textContentType(.password)
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(lineWidth: 1))
            }.padding(.vertical, 32)

            Button(action: signUp) {
                Text("S'inscrire")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .background(Color.blue)
                    .cornerRadius(5)
            }

            if error != "" {
                Text(error)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.red)
                    .padding()
            }

            Spacer()
        }.padding(.horizontal, 32)
    }
}
