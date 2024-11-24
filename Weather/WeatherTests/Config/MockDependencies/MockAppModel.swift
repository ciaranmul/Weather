//
//  MockAppModel.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

import Combine
@testable import Weather

final class MockAppModel: AppModelType {
    var weatherState: AnyPublisher<Weather.WeatherDataState, Never> {
        weatherStateSubject.eraseToAnyPublisher()
    }

    func addressSubmitted(_ address: String) {
        submittedAddresses.append(address)
    }

    var weatherStateSubject = CurrentValueSubject<WeatherDataState, Never>(.pending)
    var submittedAddresses: [String] = []
}
