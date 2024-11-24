//
//  HasUserLocationProvider.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

/// Has a user location data provider
protocol HasUserLocationDataProvider {
    var userLocationDataProvider: UserLocationDataProviderType { get }
}
