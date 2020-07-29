//
//  History.swift
//  Reparo
//
//  Created by Antoine on 09/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI
import Firebase


class History: ObservableObject {
    
    @Published var interventions: [Intervention] = []
    
    func fetchInterventions(forUID uid: String) {
        var tmp = [Intervention]()
        DatabaseService.shared.fetchInterventions(forUID: uid) { (snap, error) in
            if let error = error {
                print(" ERROR: \(error) ")
            } else if let documents = snap?.documents {
                for document in documents {
                    let data = document.data()
                    tmp.append(Intervention(
                        id: document.documentID,
                        issueType: data["type"] as? String ?? "-",
                        issuePrecision: data["precision"] as? String ?? "-",
                        description: data["description"] as? String ?? "-",
                        status: Intervention.Status(rawValue: data["status"] as? String ?? "submitted")!))
                }
                self.interventions = tmp
            }
        }
    }
}

