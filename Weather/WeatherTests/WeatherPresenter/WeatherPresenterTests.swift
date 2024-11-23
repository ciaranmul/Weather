//
//  WeatherPresenterTests.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

import Testing
@testable import Weather

struct WeatherViewTests {
    let mockModel: MockAppModel
    let subject: WeatherPresenter

    init() {
        mockModel = MockAppModel()
        subject = WeatherPresenter(model: mockModel)
    }

    @Test func weatherViewState() async throws {
        #expect(subject.weatherState.isLoading())
    }
}

extension WeatherViewState {
    func isLoading() -> Bool {
        guard case .loading = self else {
            return false
        }

        return true
    }
}
