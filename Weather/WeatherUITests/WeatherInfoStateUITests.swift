//
//  WeatherInfoStateUITests.swift
//  WeatherUITests
//
//  Created by Ciarán Mulholland on 01/12/2024.
//

import XCTest

final class WeatherInfoStateUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws { }

    func testInitialState() throws {
        let app = XCUIApplication()
        app.launch()

        XCTAssertFalse(app.staticTexts["temperature_label"].exists)
    }

    @MainActor
    func testWeatherAvailableState() throws {
        let app = XCUIApplication()
        app.launch()

        let textField = app.textFields["address_search_field"]
        textField.tap()
        textField.typeText("1 infinite loop")
        app.keyboards.buttons["Search"].tap()

        // wait for existence because state depends on network response
        XCTAssertTrue(app.staticTexts["temperature_label"].waitForExistence(timeout: 1))
        XCTAssertTrue(app.staticTexts["feels_like_label"].waitForExistence(timeout: 1))
        XCTAssertTrue(app.staticTexts["rain_label"].waitForExistence(timeout: 1))
        XCTAssertTrue(app.staticTexts["wind_speed_label"].waitForExistence(timeout: 1))
        XCTAssertTrue(app.staticTexts["wind_direction_label"].waitForExistence(timeout: 1))
        XCTAssertTrue(app.staticTexts["cloud_cover_label"].waitForExistence(timeout: 1))
    }

    @MainActor
    func testWeatherUnavailableState() throws {
        let app = XCUIApplication()
        app.launch()

        let textField = app.textFields["address_search_field"]
        textField.tap()
        textField.typeText("Address that doesn’t exist")
        app.keyboards.buttons["Search"].tap()

        // wait for existence because state depends on network response
        XCTAssertTrue(app.staticTexts["main_error_message"].waitForExistence(timeout: 1))
        XCTAssertTrue(app.staticTexts["detailed_error_message"].waitForExistence(timeout: 1))
    }
}
