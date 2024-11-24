//
//  CurrentUnits.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

struct CurrentUnits: Decodable {
    let time: String
    let temperature: String
    let apparentTemperature: String
    let rain: String
    let cloudCover: String
    let windSpeed: String
    let windDirection: String
    let windGusts: String

    enum CodingKeys: String, CodingKey {
        case time
        case temperature = "temperature_2m"
        case apparentTemperature = "apparent_temperature"
        case rain
        case cloudCover = "cloud_cover"
        case windSpeed = "wind_speed_10m"
        case windDirection = "wind_direction_10m"
        case windGusts = "wind_gusts_10m"
    }
}
