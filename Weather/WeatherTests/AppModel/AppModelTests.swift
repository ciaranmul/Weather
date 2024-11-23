//
//  AppModelTests.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

import Testing
import Combine
@testable import Weather

struct AppModelTests {
    let mockDependencies: MockDependencyContainer
    let subject: AppModel

    init() {
        mockDependencies = MockDependencyContainer()
        subject = AppModel(dependencyContainer: mockDependencies)
    }

    @Test func weatherDataState() async throws {
        var iterator = subject
            .weatherState
            .values
            .makeAsyncIterator()

        let nextValue = await iterator.next()

        let state = try #require(nextValue)
        let result = try #require(dataForState(state))

        #expect(result.temperature == "13°C")
        #expect(result.apparentTemperature == "10°C")
        #expect(result.cloudCover == "a bit")
        #expect(result.wind == "lots")
        #expect(result.rain == "some")
    }

    func dataForState(_ state: WeatherDataState) -> WeatherData? {
        switch state {
        case .failure, .fetching, .pending:
            nil
        case let .success(data):
            data
        }
    }
}
