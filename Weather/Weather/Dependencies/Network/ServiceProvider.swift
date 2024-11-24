//
//  ServiceProvider.swift
//  Weather
//
//  Created by Ciarán Mulholland on 24/11/2024.
//
import Foundation

enum ServiceProvider {
    static func request<T: Decodable>(endpoint: Endpoint,
                                      decodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) async -> Result<T, ServiceProviderError> {
        guard let url = endpoint.url else {
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

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = decodingStrategy

            let object = try decoder.decode(T.self, from: data)
            return .success(object)
        } catch {
            return .failure(.underlying(error))
        }
    }
}
