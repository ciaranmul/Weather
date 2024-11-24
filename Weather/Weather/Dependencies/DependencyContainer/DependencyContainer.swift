//
//  DependencyContainer.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

/// Contains all of the dependencies that should be injected in the app
struct DependencyContainer: DependencyContainerType {
    var weatherDataProvider: WeatherDataProviderType
    var userLocationDataProvider: UserLocationDataProviderType
}
