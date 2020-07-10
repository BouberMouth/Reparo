//
//  IssueCreationView.swift
//  Reparo
//
//  Created by Antoine on 07/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct IssueCreationView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var session: SessionStore
    @ObservedObject var issueCreation = IssueCreation()
    
    
    var body: some View {
        Group {
            if issueCreation.issueType == nil {
                IssueTypeFormView(issueCreation: self.issueCreation)
            } else if !issueCreation.hasChosenIssue {
                IssuePrecisionFormView(issueCreation: self.issueCreation)
            } else if !issueCreation.hasWrittenDescription {
                IssueDescriptionView(issueCreation: self.issueCreation)
            } else if !issueCreation.interventionWasConfirmed {
                IssueConfirmationView(issueCreation: self.issueCreation)
            } else {
                ZStack {
                    RoundedRectangle(cornerRadius: 5).fill(Color.blue)
                    Text("Retour à l'écran d'accueil")
                }.onTapGesture {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}
