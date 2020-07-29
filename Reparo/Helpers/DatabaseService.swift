//
//  DatabaseService.swift
//  Reparo
//
//  Created by Antoine on 07/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import Foundation
import Firebase

class DatabaseService {
    
    static let shared = DatabaseService()
    
    let db = Firestore.firestore()

    //MARK: - USER MANIPULATIONS

    func createUser(uid: String, username: String, email: String) {
        let dict: [String: Any] = [
            "uuid": uid,
            "email": email,
            "username": username
        ]
        db.collection("users").document(uid).setData(dict)
    }

    func getUserInfos(uid: String, handler: @escaping FIRDocumentSnapshotBlock) {
        db.collection("users").document(uid).getDocument(completion: handler)
    }

    //MARK: - INTERVENTION MANIPULATIONS

    func createIntervention(uid: String, type: String, precision: String, description: String) {
        db.collection("interventions").addDocument(data: [
            "uid": uid,
            "type": type,
            "precision": precision,
            "description": description,
            "status": Intervention.Status.submitted.rawValue
        ])
    }
    
    func fetchInterventions(forUID uid: String, handler: @escaping FIRQuerySnapshotBlock) {
        db.collection("interventions").whereField("uid", isEqualTo: uid).getDocuments(completion: handler)
    }

}

struct UserInfos {
    var username: String
    var email: String
    var phone: String
    var address: String
}
