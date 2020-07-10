//
//  IssuePrecisionFormView.swift
//  Reparo
//
//  Created by Antoine on 07/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct IssuePrecisionFormView: View {
    @ObservedObject var issueCreation: IssueCreation
    
    var body: some View {
        VStack {
            Text(issueCreation.issueType?.label ?? "")
                .font(.system(size: 32, weight: .heavy, design: .rounded))
                .multilineTextAlignment(.center)
            
            Text(issueCreation.issuePrecisionQ)
                .font(.system(size: 18, weight: .medium, design: .rounded))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            ForEach(issueCreation.issuePrecisionA.indices) { i in
                Button(action: {
                    self.issueCreation.issuePrecision = self.issueCreation.issuePrecisionA[i]
                    self.issueCreation.hasChosenIssue = true
                    print(self.issueCreation.issueType!.label + "--" + self.issueCreation.issuePrecision!.label)
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5).fill(Color.blue)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(minHeight: 0, maxHeight: 100)
                        Text(self.issueCreation.issuePrecisionA[i].label)
                            .font(.system(size: 27, weight: .medium, design: .rounded))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                }
            }
            
            Button(action: {
                self.issueCreation.issueType = nil
            }) {
                Text("Retour")
                    .font(.system(size: 27, weight: .medium, design: .rounded))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
            }
            
        }.padding()
    }
}
