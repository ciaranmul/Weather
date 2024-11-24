//
//  MapsCoServiceProviderType.swift
//  Weather
//
//  Created by Ciarán Mulholland on 24/11/2024.
//

/// Provides the APIs available from maps.co
protocol MapsCoServiceProviderType {
    /// Performs a request to search for the provided address
    ///
    /// - Parameters:
    ///     - address: the address to search for
    /// - Returns: A Result containing a set of search results upon success, or the error upon failure
    func search(address: String) async -> Result<[SearchResult], ServiceProviderError>
}
