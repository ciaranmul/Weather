//
//  Response.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

struct CurrentWeatherData: Decodable {
    let temperature: Float
    let apparentTemperature: Float
    let rain: Float
    let cloudCover: Float
    let windSpeed: Float
    let windDirection: Float
    let windGusts: Float

    enum CodingKeys: String, CodingKey {
        case temperature = "temperature_2m"
        case apparentTemperature = "apparent_temperature"
        case rain
        case cloudCover = "cloud_cover"
        case windSpeed = "wind_speed_10m"
        case windDirection = "wind_direction_10m"
        case windGusts = "wind_gusts_10m"
    }
}
