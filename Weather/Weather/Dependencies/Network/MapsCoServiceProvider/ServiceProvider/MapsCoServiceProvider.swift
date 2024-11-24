//
//  MapsCoServiceProvider.swift
//  Weather
//
//  Created by Ciarán Mulholland on 24/11/2024.
//

/// Concrete implementation of the MapsCoServiceProviderType
///
/// This class utilises the API key it is created with to make requests to the Maps.co API
final class MapsCoServiceProvider: MapsCoServiceProviderType {
    private var apiKey: String

    init(apiKey: String) {
        self.apiKey = apiKey
    }

    func search(address: String) async -> Result<[SearchResult], ServiceProviderError> {
        await ServiceProvider.request(endpoint: MapsCoAPI.geocode(address: address).endpoint(apiKey: apiKey),
                                      decodingStrategy: .convertFromSnakeCase)
    }
}
