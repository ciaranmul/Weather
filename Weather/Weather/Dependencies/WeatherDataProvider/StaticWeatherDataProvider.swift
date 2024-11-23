//
//  StaticWeatherDataProvider.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

/// A static implementation of the `WeatherProviderType` that returns fixtures instead of live data
final class StaticWeatherDataProvider: WeatherDataProviderType {
    func getWeatherData(for: Location) async throws -> WeatherData {
        .fixture
    }
}

extension WeatherData {
    static let fixture: WeatherData = WeatherData(temperature: "13°C",
                                                  apparentTemperature: "10°C",
                                                  wind: "lots",
                                                  rain: "some",
                                                  cloudCover: "a bit")
}
