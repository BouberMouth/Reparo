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
            VStack {
                Text(intervention.id)
                Text(intervention.issueType)
                Text(intervention.issuePrecision)
                Text(intervention.description)
            }
        }.padding()
    }
}
