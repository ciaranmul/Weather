//
//  WeatherViewState.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

/// Represents the state of the weather view
enum WeatherViewState {
    /// No weather data has been fetched
    case pending
    /// Weather data is being fetched
    case loading
    /// Weather data is ready
    /// - Parameters:
    ///    - weather view model: Data type representing the weather data to be displayed
    case ready(WeatherViewModel)
    /// An error occurred
    /// - Parameters:
    ///     - error message: A message describing what went wrong
    case error(String)
}
