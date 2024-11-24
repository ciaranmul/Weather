//
//  WeatherDataFixtures.swift
//  Weather
//
//  Created by Ciarán Mulholland on 24/11/2024.
//
@testable import Weather

extension WeatherData {
    static let fixture: WeatherData = WeatherData(temperature: .init(value: 2.5, unit: "°C"),
                                                  apparentTemperature: .init(value: -1.3, unit: "°C"),
                                                  rain: .init(value: 0.00, unit: "mm"),
                                                  cloudCover: .init(value: 100, unit: "%"),
                                                  windSpeed: .init(value: 10.1, unit: "km/h"),
                                                  windDirection: .init(value: 197, unit: "°"),
                                                  windGusts: .init(value: 23.8, unit: "km/h"))
}
