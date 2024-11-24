//
//  OpenMeteoServiceProvider.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

import Foundation

final class OpenMeteoServiceProvider: OpenMeteoServiceProviderType {
    func getCurrentForecast(latitude: Double, longitude: Double) async -> Result<CurrentWeatherResponse, OpenMeteoServiceError> {
        guard let url = OpenMeteoAPI.forecast(latitude: latitude, longitude: longitude).endpoint.url else {
            return .failure(.invalidURL)
        }

        let urlRequest = URLRequest(url: url)
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard let httpResponse = (response as? HTTPURLResponse) else {
                return .failure(.invalidResponse)
            }

            guard Array(200...299).contains(httpResponse.statusCode) else {
                return .failure(.statusCode(httpResponse.statusCode))
            }

            let currentWeatherResponse = try JSONDecoder().decode(CurrentWeatherResponse.self, from: data)
            return .success(currentWeatherResponse)
        } catch {
            return .failure(.underlying(error))
        }
    }
}
