//
//  MockWeatherProvider.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

@testable import Weather

final class MockWeatherDataProvider: WeatherDataProviderType {
    var weatherDataToReturn: WeatherData = .fixture

    func getWeatherData(for: Weather.Location) async throws -> Weather.WeatherData {
        weatherDataToReturn
    }
}
