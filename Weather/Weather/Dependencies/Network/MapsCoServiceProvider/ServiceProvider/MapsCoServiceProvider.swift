//
//  MapsCoServiceProvider.swift
//  Weather
//
//  Created by Ciarán Mulholland on 24/11/2024.
//

final class MapsCoServiceProvider: MapsCoServiceProviderType {
    func search(address: String) async -> Result<[SearchResult], ServiceProviderError> {
        await ServiceProvider.request(endpoint: MapsCoAPI.geocode(address: address).endpoint,
                                      decodingStrategy: .convertFromSnakeCase)
    }
}
