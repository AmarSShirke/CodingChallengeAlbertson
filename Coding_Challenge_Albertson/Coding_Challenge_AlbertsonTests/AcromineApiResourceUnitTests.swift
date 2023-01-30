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
            XCTAssertEqual(request.sf, acromineResponse?[0].sf)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
    }
    
    //Note: Can't write test_AcromineApiResource_with_ValidRequest_Returns_Error because if I pass any invalid parameter like special character or number even though API didn't give any error message it returns empty array.
    
}
