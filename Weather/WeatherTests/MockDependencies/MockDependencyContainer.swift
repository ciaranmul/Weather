//
//  MockDependencyContainer.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

@testable import Weather

struct MockDependencyContainer: DependencyContainerType {
    var userLocationProvider:  UserLocationProviderType {
        mockUserLocationProvider
    }

    var weatherDataProvider: WeatherDataProviderType{
        mockWeatherDataProvider
    }

    let mockUserLocationProvider = MockUserLocationProvider()
    let mockWeatherDataProvider = MockWeatherDataProvider()
}
