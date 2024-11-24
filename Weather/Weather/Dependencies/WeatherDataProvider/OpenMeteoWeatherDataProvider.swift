//
//  OpenMeteoWeatherDataProvider.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

import Foundation

/// Concrete implementation of `WeatherDataProviderType`
///
/// This implementation uses the Open-Meteo API to get weather data
final class OpenMeteoWeatherDataProvider: WeatherDataProviderType {
    private let openMeteoServiceProvider: OpenMeteoServiceProviderType

    /// Creates an instance of the OpenMeteoWeatherDataProvider
    ///
    /// - Parameters:
    ///     - openMeteoServiceProvider: A class that provides access to the Open-Meteo service
    init(openMeteoServiceProvider: OpenMeteoServiceProviderType) {
        self.openMeteoServiceProvider = openMeteoServiceProvider
    }

    func getWeatherData(for location: Location) async throws -> WeatherData {
        let result = await openMeteoServiceProvider.getCurrentForecast(latitude: location.latitude,
                                                                       longitude: location.longitude)

        switch result {
        case let .success(response):
            let data = response.currentWeatherData
            let units = response.currentUnits
            return WeatherData(temperature: .init(value: data.temperature,
                                                  unit: units.temperature),
                               apparentTemperature: .init(value: data.apparentTemperature,
                                                          unit: units.apparentTemperature),
                               rain: .init(value: data.rain,
                                           unit: units.rain),
                               cloudCover: .init(value: data.cloudCover,
                                                 unit: units.cloudCover),
                               windSpeed: .init(value: data.windSpeed,
                                                unit: units.windSpeed),
                               windDirection: .init(value: data.windDirection,
                                                    unit: units.windDirection),
                               windGusts: .init(value: data.windGusts,
                                                unit: units.windGusts))
        case let .failure(error):
            throw error
        }
    }
}
