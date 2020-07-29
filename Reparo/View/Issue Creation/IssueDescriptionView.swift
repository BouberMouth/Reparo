//
//  IssueDescriptionView.swift
//  Reparo
//
//  Created by Antoine on 07/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct IssueDescriptionView: View {
    @EnvironmentObject var session: SessionStore
    @ObservedObject var issueCreation: IssueCreation
    @State var description: String = ""
    
    var body: some View {
        VStack {
            Text(issueCreation.issueType?.label ?? "")
                .font(.system(size: 32, weight: .heavy, design: .rounded))
                .multilineTextAlignment(.center)

            Text("Si vous avez d'autres informations concernant ce problème, veuillez les écrire ci-dessous.")
                .font(.system(size: 18, weight: .medium, design: .rounded))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)

            TextField("Plus d'infos", text: $description)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.system(size: 14, weight: .bold, design: .rounded))
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 50)
                .cornerRadius(5)
                .padding(.vertical, 5)
                .multilineTextAlignment(.center)

            Spacer()

            Button(action: {
                if self.description.trimmingCharacters(in: [" "]) == "" {
                    self.issueCreation.description = "Aucune description"
                } else {
                    self.issueCreation.description = self.description.trimmingCharacters(in: [" "])
                }
                self.issueCreation.hasWrittenDescription = true
            }) {
            Text("Suivant")
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 50)
                .foregroundColor(.white)
                .font(.system(size: 14, weight: .bold, design: .rounded))
                .background(Color.blue)
                .cornerRadius(5)
            }

            Button(action: {
                if self.issueCreation.issueType == .other {
                    self.issueCreation.issueType = nil
                    self.issueCreation.issuePrecision = nil
                }
                self.issueCreation.issuePrecision = nil
                self.issueCreation.hasChosenIssue = false
            }) {
                Text("Retour")
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(.blue)
                    .cornerRadius(5)
                    .padding(.vertical, 5)
                    .multilineTextAlignment(.center)
            }

        }.padding()
            .onAppear {
                self.description = self.issueCreation.description
        }
    }
}
