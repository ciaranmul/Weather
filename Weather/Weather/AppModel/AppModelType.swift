//
//  AppModelType.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

import Combine

/// Describes the capabilities of the app business logic
protocol AppModelType {
    /// Publishes the latest weather state
    var weatherState: AnyPublisher<WeatherDataState, Never> { get }
    /// Submitting an address updates the weather state to reflect that address
    ///
    /// Triggers calls to geocode the provided address string and fetch weather data based on the geocoded address. The weather data state is updated to reflect the state of this update.
    ///
    /// - Parameters:
    ///     - address: The new address for which the app should display the current weather.
    func addressSubmitted(_ address: String)
}
