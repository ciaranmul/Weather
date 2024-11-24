//
//  CLGeocoder+UserLocationDataProvider.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

import CoreLocation

/// Extends `CLGeocoder` to conform to `UserLocationDataProvider`
///
/// This allows the built-in `CLGeocoder` to be used to provide geocoding behaviour when the third-party option is unavailable.
extension CLGeocoder: UserLocationDataProviderType {
    func getLocation(for address: String) async throws -> Location {
        let placemark = try await geocodeAddressString(address)

        guard let latitude = placemark.first?.location?.coordinate.latitude as? Double,
              let longitude = placemark.first?.location?.coordinate.longitude as? Double else {
            throw GeocodingError.locationNotFound
        }

        return Location(latitude: latitude,
                        longitude: longitude)
    }
}

/// Errors which may occur when geocoding an address
enum GeocodingError: Error {
    /// The location could not be found
    case locationNotFound
    /// The returned coordinates are invalid
    case invalidCoordinates
}
