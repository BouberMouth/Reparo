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
                        RoundedRectangle(cornerRadius: 5).fill(Color.blue)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(minHeight: 0, maxHeight: 100)
                        Text(issueType.label)
                            .font(.system(size: 27, weight: .medium, design: .rounded))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                }
            }
            
        }.padding()
    }
}
