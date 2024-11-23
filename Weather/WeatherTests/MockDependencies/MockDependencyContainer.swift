//
//  MockDependencyContainer.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

@testable import Weather

struct MockDependencyContainer: DependencyContainerType {
    var userLocationDataProvider:  UserLocationDataProviderType {
        mockUserLocationDataProvider
    }

    var weatherDataProvider: WeatherDataProviderType{
        mockWeatherDataProvider
    }

    let mockUserLocationDataProvider = MockUserLocationDataProvider()
    let mockWeatherDataProvider = MockWeatherDataProvider()
}
