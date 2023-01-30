//
//  AcromineValidationUnitTests.swift
//  Coding_Challenge_AlbertsonTests
//
//  Created by Amar Shirke on 30/01/23.
//

import XCTest
@testable import Coding_Challenge_Albertson

final class AcromineValidationUnitTests: XCTestCase {

    func test_AcromineValidation_With_Numbers_Returns_ValidationFailure(){

        let validation = AcromineValidation()
        let request = AcromineRequest(lf: "", sf: "000")

        let result = validation.Validate(acromineRequest: request)

        XCTAssertFalse(result.isValid)
        XCTAssertNotNil(result.message)
        XCTAssertEqual(result.message, "Invalid input.")

    }

    func test_AcromineValidation_With_WhiteSpace_Returns_ValidationFailure(){

        let validation = AcromineValidation()
        let request = AcromineRequest(lf: "", sf: " ")

        let result = validation.Validate(acromineRequest: request)

        XCTAssertFalse(result.isValid)
        XCTAssertNotNil(result.message)
        XCTAssertEqual(result.message, "Invalid input.")

    }
    
    func test_AcromineValidation_With_ValidRequest_Returns_Success(){

        let validation = AcromineValidation()
        let request = AcromineRequest(lf: "", sf: "UK")
        
        let result = validation.Validate(acromineRequest: request)

        XCTAssertTrue(result.isValid)
        XCTAssertNil(result.message)
    }
    
}
