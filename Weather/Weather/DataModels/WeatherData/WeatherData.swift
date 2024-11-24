//
//  WeatherData.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

/// Wraps a value with its unit
struct ValueWithUnit<T> {
    let value: T
    let unit: String
}

/// Describes the current weather
struct WeatherData {
    let temperature: ValueWithUnit<Float>
    let apparentTemperature: ValueWithUnit<Float>
    let rain: ValueWithUnit<Float>
    let cloudCover: ValueWithUnit<Float>
    let windSpeed: ValueWithUnit<Float>
    let windDirection: ValueWithUnit<Float>
    let windGusts: ValueWithUnit<Float>
}
