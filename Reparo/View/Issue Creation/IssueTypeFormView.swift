//
//  IssueTypeFormView.swift
//  Reparo
//
//  Created by Antoine on 07/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct IssueTypeFormView: View {
    @ObservedObject var issueCreation: IssueCreation
    
    var body: some View {
        VStack {
            Text("Créer une intervention")
                .font(.system(size: 32, weight: .heavy, design: .rounded))
                .multilineTextAlignment(.center)

            Text(issueCreation.issueTypeQ)
                .font(.system(size: 18, weight: .medium, design: .rounded))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)

            Spacer()
            
            ForEach(IssueType.allCases) { issueType in
                Button(action: {
                    if issueType == .other {
                        self.issueCreation.issueType = .other
                        self.issueCreation.hasChosenIssue = true
                    } else {
                        self.issueCreation.issueType = issueType
                    }
                }) {
                    ZStack {
                        Text(issueType.label)
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
            }
        }.padding()
    }
}
