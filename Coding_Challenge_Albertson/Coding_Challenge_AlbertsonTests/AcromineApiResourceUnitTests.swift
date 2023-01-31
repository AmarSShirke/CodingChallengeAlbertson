//
//  AcromineApiResourceUnitTests.swift
//  Coding_Challenge_AlbertsonTests
//
//  Created by Amar Shirke on 29/01/23.
//

import XCTest
@testable import Coding_Challenge_Albertson

final class AcromineApiResourceUnitTests: XCTestCase {

   func test_AcromineApiResource_with_ValidRequest_Returns_AcromineResponse()
    {
        
        let request = AcromineRequest(lf: "", sf: "UK")
        let resource = AcromineResource()
        let expectation = self.expectation(description: "ValidRequest_Returns_AcromineResponse")
        
        resource.getAcromine(acromineRequest: request) { acromineResponse in
            
            XCTAssertNotNil(acromineResponse)
            XCTAssertEqual(request.sf, acromineResponse?[0].sf, "sf match")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 30, handler: nil)
        
    }
    
    func test_AcromineApiResource_with_ValidRequest_Returns_Blank(){

        let request = AcromineRequest(lf: "", sf: "N")
        let resource = AcromineResource()
        let expectation = self.expectation(description: "ValidRequest_Returns_Blank")
        
        resource.getAcromine(acromineRequest: request) { acromineResponse in
            
            XCTAssertNotNil(acromineResponse)
            XCTAssertEqual(acromineResponse?.count, 0, "Acronym is empty")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 30, handler: nil)

    }
    
}
