//
//  StaticWeatherDataProvider.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

/// A static implementation of the `WeatherProviderType` that returns fixtures instead of live data
final class StaticWeatherDataProvider: WeatherDataProviderType {
    func getWeatherData(for location: Location) async throws -> WeatherData {
        .fixture
    }
}

extension WeatherData {
    static let fixture: WeatherData = WeatherData(temperature: .init(value: 2.5, unit: "°C"),
                                                  apparentTemperature: .init(value: -1.3, unit: "°C"),
                                                  rain: .init(value: 0.00, unit: "mm"),
                                                  cloudCover: .init(value: 100, unit: "%"),
                                                  windSpeed: .init(value: 10.1, unit: "km/h"),
                                                  windDirection: .init(value: 197, unit: "°"),
                                                  windGusts: .init(value: 23.8, unit: "km/h"))
}
