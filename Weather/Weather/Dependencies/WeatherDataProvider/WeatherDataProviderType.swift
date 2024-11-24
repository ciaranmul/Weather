//
//  WeatherDataProviderType.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

protocol HasWeatherDataProvider {
    var weatherDataProvider: WeatherDataProviderType { get }
}

/// A weather data provider type can supply weather data for the provided location.
protocol WeatherDataProviderType {
    /// Provides current weather data for a given location
    ///
    /// - Parameters:
    ///     - location: the coordinates for where to get weather data
    /// - Returns: Weather data for the provided location
    /// - Throws: When the request for weather data fails
    func getWeatherData(for location: Location) async throws  -> WeatherData
}
