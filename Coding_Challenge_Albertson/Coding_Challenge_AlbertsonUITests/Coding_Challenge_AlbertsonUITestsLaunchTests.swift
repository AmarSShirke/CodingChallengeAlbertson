//
//  Coding_Challenge_AlbertsonUITestsLaunchTests.swift
//  Coding_Challenge_AlbertsonUITests
//
//  Created by Amar Shirke on 30/01/23.
//

import XCTest

final class Coding_Challenge_AlbertsonUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
        
        let searchSearchField = app.searchFields["Search"]
        searchSearchField.tap()
        searchSearchField.typeText("uk")
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["United Kingdom"]/*[[".cells.staticTexts[\"United Kingdom\"]",".staticTexts[\"United Kingdom\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        searchSearchField.buttons["Clear text"].tap()
        
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
