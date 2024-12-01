//
//  AddressEntryUITests.swift
//  AddressEntryUITests
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

import XCTest

final class AddressEntryUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws { }

    @MainActor
    func testInitialState() throws {
        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.textFields["address_search_field"].exists)
    }

    @MainActor
    func testKeyboardSubmitLabel() throws {
        let app = XCUIApplication()
        app.launch()

        app.textFields["address_search_field"].tap()
        XCTAssert(app.keyboards.buttons["Search"].exists)

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Address Field Active"
        attachment.lifetime = .deleteOnSuccess
        add(attachment)
    }
}
