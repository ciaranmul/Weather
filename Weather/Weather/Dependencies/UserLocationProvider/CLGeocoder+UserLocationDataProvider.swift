//
//  CLGeocoder+UserLocationDataProvider.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

import CoreLocation

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

enum GeocodingError: Error {
    case locationNotFound
}
