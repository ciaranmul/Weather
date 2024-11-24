//
//  MockUserLocationProvider.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

import Combine
@testable import Weather

final class MockUserLocationDataProvider: UserLocationDataProviderType {
    var errorToThrow: Error?
    var userLocationDataToReturn: Location = .init(latitude: 37.3319406,
                                                   longitude: -122.0421933)

    func getLocation(for address: String) async throws -> Location {
        if let errorToThrow { throw errorToThrow }
        return userLocationDataToReturn
    }
}
