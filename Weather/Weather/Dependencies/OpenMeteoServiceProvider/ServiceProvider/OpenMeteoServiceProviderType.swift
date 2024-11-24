//
//  OpenMeteoServiceProviderType.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

protocol OpenMeteoServiceProviderType {
    func getCurrentForecast(latitude: Double, longitude: Double) async -> Result<CurrentWeatherResponse, OpenMeteoServiceError>
}
