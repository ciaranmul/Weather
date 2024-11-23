//
//  DependencyContainer.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

struct DependencyContainer: DependencyContainerType {
    var weatherDataProvider: WeatherDataProviderType
    var userLocationProvider: UserLocationProviderType
}
