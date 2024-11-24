//
//  WeatherPresenterTests.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

import Testing
@testable import Weather

struct WeatherPresenterTests {
    let mockModel: MockAppModel
    let subject: WeatherPresenter

    init() {
        mockModel = MockAppModel()
        subject = WeatherPresenter(model: mockModel)
    }

    @Test func weatherViewStateInitial() async throws {
        #expect(subject.weatherState.isLoading())
    }

    @Test func weatherViewStateFetching() async throws {
        mockModel.weatherStateSubject.send(.fetching)
        #expect(subject.weatherState.isLoading())
    }

    @Test func weatherViewStateSuccess() async throws {
        mockModel.weatherStateSubject.send(.success(.fixture))
        try #require(subject.weatherState.isReady())

        let data = try #require(subject.weatherState.data)
        #expect(data.temperature == "2.5°C")
        #expect(data.apparentTemperature == "-1.3°C")
        #expect(data.rain == "0.0mm")
        #expect(data.cloudCover == "100.0%")
        #expect(data.windSpeed == "10.1km/h (Gusts up to 23.8km/h)")
        #expect(data.windDirection == "197.0°")
    }

    @Test func weatherViewStateFailure() async throws {
        mockModel.weatherStateSubject.send(.failure(TestError.general))
        #expect(subject.weatherState.isLoading())
    }
}

enum TestError: Error {
    case general
}

extension WeatherViewState {
    func isLoading() -> Bool {
        guard case .loading = self else {
            return false
        }

        return true
    }

    func isReady() -> Bool {
        guard case .ready = self else {
            return false
        }

        return true
    }

    var data: WeatherViewModel? {
        switch self {
        case let .ready(data):
            data
        case .loading:
            nil
        }
    }
}
