//
//  UserLocationProviderType.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

import Combine

/// Provides user location data
protocol UserLocationDataProviderType {
    /// Gets the coordinates of the provided address
    ///
    /// - Parameters:
    ///     - address: The address to be geocoded
    /// - Returns: The location (coordinates) of the provided address
    /// - Throws: when the address cannot be found or the coordinates are invalid
    func getLocation(for address: String) async throws -> Location
}
