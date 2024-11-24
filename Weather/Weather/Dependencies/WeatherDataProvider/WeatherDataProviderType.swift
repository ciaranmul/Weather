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
    func getWeatherData(for location: Location) async throws  -> WeatherData
}
