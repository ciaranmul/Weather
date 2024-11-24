//
//  MapsCoServiceProvider.swift
//  Weather
//
//  Created by Ciarán Mulholland on 24/11/2024.
//

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
