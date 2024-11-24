//
//  AppController.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//


import CoreLocation

final class AppController {
    lazy var weatherPresenter: WeatherPresenter = {
        WeatherPresenter(model: model)
    }()

    lazy var locationPresenter: LocationPresenter = {
        LocationPresenter(model: model)
    }()

    private let dependencyContainer: DependencyContainerType
    private let model: AppModel

    init() {
        let openMeteoWeatherDataProvider = OpenMeteoWeatherDataProvider(openMeteoServiceProvider: OpenMeteoServiceProvider())

        var userLocationDataProvider: UserLocationDataProviderType

        // If a secret is not provided for the maps.co API key, CLGeocoder will be used as a fallback
        if let mapsCoApiKey: String = try? Configuration.value(for: "MAPS_CO_API_KEY") {
            userLocationDataProvider = MapsCoUserLocationProvider(mapsCoServiceProvider: MapsCoServiceProvider(apiKey: mapsCoApiKey))
        } else {
            userLocationDataProvider = CLGeocoder()
        }

        dependencyContainer = DependencyContainer(weatherDataProvider: openMeteoWeatherDataProvider,
                                                  userLocationDataProvider: userLocationDataProvider)
        model = AppModel(dependencyContainer: dependencyContainer)
    }
}
