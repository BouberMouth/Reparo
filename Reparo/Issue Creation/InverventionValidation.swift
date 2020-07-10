//
//  InverventionValidation.swift
//  Reparo
//
//  Created by Antoine on 09/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import Foundation

class InterventionValidation {
    
    static func validateUID(uid: String?) throws -> String {
        guard let uid = uid else { throw IVError.invalidValue }
        return uid
    }
    
    static func validateIssue(issueType: IssueType?) throws -> String {
        guard let issueType = issueType else { throw IVError.invalidValue }
        return issueType.label
    }
    
    static func validatePrecision(withIssue issueType: IssueType, precision: PlumbingIssue?) throws -> String {
        if issueType == .other {
            return ""
        } else {
            guard let precision = precision else { throw IVError.invalidValue }
            return precision.label
        }
    }
    
    static func validateDescription(description: String) -> String {
        let trimmedDescription = description.trimmingCharacters(in: [" "])
        if trimmedDescription == "" {
            return "Aucune Description"
        } else {
            return trimmedDescription
        }
    }
}

enum IVError: LocalizedError {
    case invalidValue
    case descriptionError

}
