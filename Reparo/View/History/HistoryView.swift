//
//  HistoryView.swift
//  Reparo
//
//  Created by Antoine on 09/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var session: SessionStore
    @ObservedObject var history = History()
    
    var body: some View {
        List {
            ForEach(history.interventions) { intervention in
                InterventionView(intervention: intervention)
            }
        }.onAppear {
            self.history.fetchInterventions(forUID: self.session.session!.uid)
        }
    }
}

struct InterventionView: View {
    var intervention: Intervention

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5).stroke()
                .foregroundColor(Color.blue)
            HStack {
                VStack {
                    Text(intervention.issueType)
                    Text(intervention.issuePrecision)
                }
                //self.makeIcon()
            }
        }.padding()
    }
    
    @ViewBuilder
    func makeIcon() -> some View {
        let systemName: String!
        let label: String!
        let color: Color!
        switch intervention.status {
        case .submitted:
            systemName = "clock"
            label = "Envoyé"
            color = .orange
        case .accepted:
            systemName = "checkmark"
            label = "Accepté par \(intervention.proName ?? "un technicien")"
            color = .orange
        case .willBeResolved:
            systemName = "wrench"
            label = "Envoyé"
            color = .orange
        case .cancelled:
            systemName = "xmark"
            label = "Annulé"
            color = .red
        case .resolved:
            systemName = "checkmark"
            label = "Envoyé"
            color = .green
        }
        
        return VStack {
            Image(systemName: systemName).foregroundColor(color)
            Text(label)
        }
    }
}
