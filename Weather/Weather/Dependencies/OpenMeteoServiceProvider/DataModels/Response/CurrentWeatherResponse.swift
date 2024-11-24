//
//  CurrentWeatherResponse.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

struct CurrentWeatherResponse: Decodable {
    let latitude: Double
    let longitude: Double
    let currentUnits: CurrentUnits
    let currentWeatherData: CurrentWeatherData

    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
        case currentUnits = "current_units"
        case currentWeatherData = "current"
    }
}
