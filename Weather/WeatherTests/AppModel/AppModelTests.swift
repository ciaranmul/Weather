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

        #expect(state.isSuccess({ result in
            result.temperature == "13°C" &&
            result.apparentTemperature == "10°C" &&
            result.cloudCover == "a bit" &&
            result.wind == "lots" &&
            result.rain == "some"
        }))
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
}
