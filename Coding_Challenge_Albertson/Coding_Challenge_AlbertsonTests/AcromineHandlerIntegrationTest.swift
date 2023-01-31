//
//  AcromineHandlerIntegrationTest.swift
//  Coding_Challenge_AlbertsonTests
//
//  Created by Amar Shirke on 30/01/23.
//

import XCTest
@testable import Coding_Challenge_Albertson

final class AcromineHandlerIntegrationTest: XCTestCase {
    
    func test_AcromineHandler_WithValidRequest_Returns_Data(){
        
        let request = AcromineRequest(lf: "", sf: "UK")
        let handler = AcromineHandler()
        let acromineExpectations = expectation(description: "WithValidRequest_Returns_AcromineData")
        
        handler.findAcromine(request: request) { acromineData in
            XCTAssertNotNil(acromineData)
            XCTAssertEqual(request.sf, acromineData?.response?[0].sf,"sf match")
            acromineExpectations.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    
    func test_AcromineHandler_WithValidRequest_Returns_BlankData(){
        
        let request = AcromineRequest(lf: "", sf: "N")
        let handler = AcromineHandler()
        let acromineExpectations = expectation(description: "WithValidRequest_Returns_AcromineData")
        
        handler.findAcromine(request: request) { acromineData in
            XCTAssertNotNil(acromineData)
            XCTAssertEqual(acromineData?.response?.count, 0, "Acronym is empty")
            acromineExpectations.fulfill()
        }
        
        waitForExpectations(timeout: 30, handler: nil)

    }
}



