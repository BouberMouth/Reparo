//
//  Intervention.swift
//  Reparo
//
//  Created by Antoine on 28/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import Foundation

struct Intervention: Identifiable {
    var id: String
    var issueType: String
    var issuePrecision: String
    var description: String
    var status: Status = .submitted
    var proID: String? = nil
    var proName: String = "Not defined yet"
    
    
    enum Status: String {
        case submitted
        case accepted
        case willBeResolved
        case cancelled
        case resolved
    }
}

