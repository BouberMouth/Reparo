//
//  IssueCreation.swift
//  Reparo
//
//  Created by Antoine on 07/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

import SwiftUI

class IssueCreation: ObservableObject {
    @Published var issueType: IssueType?
    @Published var issuePrecision: PlumbingIssue?
    @Published var description: String = ""
    @Published var hasChosenIssue = false
    @Published var interventionWasConfirmed: Bool = false
    @Published var hasWrittenDescription: Bool = false
    

    var issueTypeQ = "Pour commencer, veuillez répondre à quelques questions. Tout d'abord, quel est le type de problème que vous rencontrez ?"

    
    var issuePrecisionQ: String = "Pouvez-vous préciser la nature du problème ?"
    
    var issuePrecisionA: [PlumbingIssue] {
        switch issueType {
        case .faucet:
            return IssueType.FaucetIssue.allCases
        case .toilet:
            return IssueType.ToiletIssue.allCases
        case .heater:
            return IssueType.HeaterIssue.allCases
        case .shower:
            return IssueType.ShowerIssue.allCases
        case .piping:
            return IssueType.PipingIssue.allCases
        default:
            return []
        }
    }
    
    // MARK: - Intents
    func createIntervention(withUID uid: String?) {
        do {
            let vUID = try InterventionValidation.validateUID(uid: uid)
            let vIssue = try InterventionValidation.validateIssue(issueType: issueType)
            let vPrecision = try InterventionValidation.validatePrecision(withIssue: issueType!, precision: issuePrecision)
            let vDescription = InterventionValidation.validateDescription(description: self.description)
            DatabaseService.shared.createIntervention(
                uid: vUID,
                type: vIssue,
                precision: vPrecision,
                description: vDescription)
            self.interventionWasConfirmed = true
        } catch {
            print(error)
        }
    }
}

protocol PlumbingIssue {
    var label: String {get}
}

enum IssueType: CaseIterable, Identifiable {
    case toilet
    case faucet
    case heater
    case shower
    case piping
    case other

    var id: IssueType { return self }
    var label: String {
        switch self {
        case .toilet:
            return "Problème de toilettes"
        case .faucet:
            return "Problème de robinetterie"
        case .heater:
            return "Problème de chauffe-eau"
        case .shower:
            return "Problème de douche"
        case .piping:
            return "Problème de canalisations"
        case .other:
            return "Autre problème"
        }
    }

    enum ToiletIssue: String, PlumbingIssue, CaseIterable, Identifiable {
        case flushLeak = "Fuite de chasse d'eau"
        case flushclogged = "Chasse d'eau bouchée"
        case toiletClogged = "Toilettes bouchées"
        case other = "Autre"

        var id: ToiletIssue { return self }
        var label: String { return self.rawValue }
    }

    enum FaucetIssue: String, PlumbingIssue, CaseIterable, Identifiable {
        case faucetLeak = "Fuite d'eau"
        case irregularStream = "Jet irrégulier"
        case other = "Autre"

        var id: FaucetIssue { return self }
        var label: String { return self.rawValue }
    }

    enum HeaterIssue: String, PlumbingIssue, CaseIterable, Identifiable {
        case pressureTooHigh = "Pression trop élevée"
        case pressureTooLow = "Pression trop faible"
        case noWarmWater = "Problème de tempéréture"
        case powerCutOff = "Problème électrique"
        case noisy = "Appareil trop bruyant"
        case other = "Autre"

        var id: HeaterIssue { return self }
        var label: String { return self.rawValue }
    }

    enum ShowerIssue: String, PlumbingIssue, CaseIterable, Identifiable {
        case pressureTooHigh = "Pression trop élevée"
        case pressureTooLow = "Pression trop faible"
        case noWarmWater = "Problème de tempéréture"
        case cloggedShower = "Douche/Baignoire bouchée"
        case other = "Autre"

        var id: ShowerIssue { return self }
        var label: String { return self.rawValue }
    }

    enum PipingIssue: String, PlumbingIssue, CaseIterable, Identifiable {
        case backup = "Remontées d'eau"
        case badSmell = "Mauvaises odeurs"
        case other = "Autre"

        var id: PipingIssue { return self }
        var label: String { return self.rawValue }
    }
}
