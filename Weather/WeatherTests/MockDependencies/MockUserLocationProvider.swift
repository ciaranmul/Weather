//
//  MockUserLocationProvider.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

import Combine
@testable import Weather

final class MockUserLocationProvider: UserLocationProviderType {
    var location: AnyPublisher<Location, Never> {
        locationSubject.eraseToAnyPublisher()
    }

    let locationSubject = CurrentValueSubject<Location, Never>(Location(latitude: 37.3319406,
                                                                        longitude: -122.0421933))
}
