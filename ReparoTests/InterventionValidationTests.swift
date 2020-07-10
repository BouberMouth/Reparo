//
//  InterventionValidationTests.swift
//  ReparoTests
//
//  Created by Antoine on 09/07/2020.
//  Copyright © 2020 BOUBERBOUCHE Antoine. All rights reserved.
//

@testable import Reparo
import XCTest

class InterventionValidationTests: XCTestCase {
    
    override func setUp() { super.setUp() }
    
    override func tearDown() { super.tearDown() }
    
    func test_is_uid_valid() throws {
        XCTAssertNoThrow(try InterventionValidation.validateUID(uid: "abc"))
        XCTAssertThrowsError(try InterventionValidation.validateUID(uid: nil))
    }
    
    func test_is_issue_valid() throws {
        XCTAssertEqual(try InterventionValidation.validateIssue(issueType: .heater), IssueType.heater.label)
        XCTAssertThrowsError(try InterventionValidation.validateIssue(issueType: nil))
    }
    
    func test_is_precision_valid() throws {
        XCTAssertEqual(try InterventionValidation.validatePrecision(withIssue: .other, precision: nil), "")
        XCTAssertThrowsError(try InterventionValidation.validatePrecision(withIssue: .faucet, precision: nil))
        XCTAssertEqual(try InterventionValidation.validatePrecision(withIssue: .heater, precision: IssueType.HeaterIssue.noWarmWater), IssueType.HeaterIssue.noWarmWater.label)
    }
}
