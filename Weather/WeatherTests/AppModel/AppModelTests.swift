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

        // initially
        var nextValue = await iterator.next()

        var state = try #require(nextValue)
        #expect(state.isPending())

        // Submit an address
        subject.addressSubmitted("123 some street, some town")

        nextValue = await iterator.next()

        state = try #require(nextValue)
        #expect(state.isFetching())

        nextValue = await iterator.next()

        state = try #require(nextValue)
        let data = try #require(state.data)

        #expect(data.temperature.value == 2.5)
        #expect(data.temperature.unit == "°C")
        #expect(data.apparentTemperature.value == -1.3)
        #expect(data.apparentTemperature.unit == "°C")
        #expect(data.cloudCover.value == 100)
        #expect(data.cloudCover.unit == "%")
        #expect(data.windSpeed.value == 10.1)
        #expect(data.windSpeed.unit == "km/h")
        #expect(data.windDirection.value == 197)
        #expect(data.windDirection.unit == "°")
        #expect(data.windGusts.value == 23.8)
        #expect(data.windGusts.unit == "km/h")
        #expect(data.rain.value == 0.00)
        #expect(data.rain.unit == "mm")
    }
}

extension DataState {
    func isPending() -> Bool {
        guard case .pending = self else {
            return false
        }

        return true
    }

    func isFetching() -> Bool {
        guard case .fetching = self else {
            return false
        }

        return true
    }

    func isSuccess(_ test: (T) -> Bool) -> Bool {
        guard case let .success(data) = self else {
            return false
        }

        return test(data)
    }

    func isFailure(_ test: (Error) -> Bool) -> Bool {
        guard case let .failure(error) = self else {
            return false
        }

        return test(error)
    }

    var data: T? {
        switch self {
        case let .success(data):
            return data
        case .pending, .fetching, .failure:
            return nil
        }
    }
}
