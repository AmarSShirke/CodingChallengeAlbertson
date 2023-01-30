//
//  AcromineHandlerIntegrationTest.swift
//  Coding_Challenge_AlbertsonTests
//
//  Created by Amar Shirke on 30/01/23.
//

import XCTest
@testable import Coding_Challenge_Albertson

final class AcromineHandlerIntegrationTest: XCTestCase {
    
    func test_LoginHandler_WithValidRequest_Returns_LoginData(){
        
        let request = AcromineRequest(lf: "", sf: "UK")
        let handler = AcromineHandler()
        let acromineExpectations = expectation(description: "WithValidRequest_Returns_AcromineData")
        
        handler.findAcromine(request: request) { acromineData in
            XCTAssertNotNil(acromineData)
            XCTAssertEqual(request.sf, acromineData?.response?[0].sf)
            acromineExpectations.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    //Note: Can't write remaining test cases because if I pass any invalid parameter like special character or number even though API didn't give any error message it returns empty array.
}



