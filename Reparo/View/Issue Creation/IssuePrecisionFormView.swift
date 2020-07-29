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
            
            ForEach(issueCreation.issuePrecisionA.indices) { index in
                Button(action: {
                    self.issueCreation.issuePrecision = self.issueCreation.issuePrecisionA[index]
                    self.issueCreation.hasChosenIssue = true
                    print(self.issueCreation.issueType!.label + "--" + self.issueCreation.issuePrecision!.label)
                }) {
                   
                        Text(self.issueCreation.issuePrecisionA[index].label)
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 50)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(5)
                            .padding(.vertical, 5)
                            .multilineTextAlignment(.center)
                    
                }
            }
            Button(action: {
                self.issueCreation.issueType = nil
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
    }
}
