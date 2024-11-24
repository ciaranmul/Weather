//
//  MapsCoUserLocationProvider.swift
//  Weather
//
//  Created by Ciarán Mulholland on 24/11/2024.
//

/// Concrete implementation of the `UserLocationDataProviderType`
///
/// This implementation uses the maps.co geocoding API to determine the location of the provided address.
final class MapsCoUserLocationProvider: UserLocationDataProviderType {
    private let mapsCoServiceProvider: MapsCoServiceProviderType

    init(mapsCoServiceProvider: MapsCoServiceProviderType) {
        self.mapsCoServiceProvider = mapsCoServiceProvider
    }

    func getLocation(for address: String) async throws -> Location {
        let result = await mapsCoServiceProvider.search(address: address)

        switch result {
        case let .success(response):
            guard let data = response.first else {
                throw GeocodingError.locationNotFound
            }

            guard let latitude = Double(data.lat),
                  let longitude = Double(data.lon) else {
                throw GeocodingError.invalidCoordinates
            }

            return Location(latitude: latitude,
                            longitude: longitude)
        case let .failure(error):
            throw error
        }
    }
}


