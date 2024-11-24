//
//  MapsCoServiceProviderType.swift
//  Weather
//
//  Created by Ciarán Mulholland on 24/11/2024.
//

protocol MapsCoServiceProviderType {
    func search(address: String) async -> Result<[SearchResult], ServiceProviderError>
}
