//
//  IssueConfirmationView.swift
//  Reparo
//
//  Created by Antoine on 07/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct IssueConfirmationView: View {
    @EnvironmentObject var session: SessionStore
    @ObservedObject var issueCreation: IssueCreation
    
    var body: some View {
        VStack {
            Text("Récapitulatif")
                .font(.system(size: 32, weight: .heavy, design: .rounded))
                .multilineTextAlignment(.center)
            
            Text("Voici le récapitulatif de votre problème.")
                .font(.system(size: 18, weight: .medium, design: .rounded))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            HStack {
                VStack(alignment: .leading) {
                    Text(issueCreation.issueType?.label ?? "")
                    Text(issueCreation.issuePrecision?.label ?? "")
                    Text(issueCreation.description)
                }
                Spacer()
            }
                .multilineTextAlignment(.leading)
                .font(.system(size: 20, weight: .medium))
            
            
            Spacer()
            
            Button(action: {
                self.issueCreation.createIntervention(withUID: self.session.session?.uid)
            }) {
            Text("Confirmer l'intervention")
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 50)
                .foregroundColor(.white)
                .font(.system(size: 14, weight: .bold, design: .rounded))
                .background(Color.blue)
                .cornerRadius(5)
            }
            
            Button(action: {
                self.issueCreation.hasWrittenDescription = false
            }) {
                Text("Retour")
                    .font(.system(size: 27, weight: .medium, design: .rounded))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
            }
            
        }.padding()
    }
}

