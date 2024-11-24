//
//  OpenMeteoServiceProvider.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

final class OpenMeteoServiceProvider: OpenMeteoServiceProviderType {
    func getCurrentForecast(latitude: Double, longitude: Double) async -> Result<CurrentWeatherResponse, ServiceProviderError> {
        await ServiceProvider.request(endpoint: OpenMeteoAPI.forecast(latitude: latitude, longitude: longitude).endpoint)
    }
}
