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
        let mapsCoUserLocationDataProvider = MapsCoUserLocationProvider(mapsCoServiceProvider: MapsCoServiceProvider())
        dependencyContainer = DependencyContainer(weatherDataProvider: openMeteoWeatherDataProvider,
                                                  userLocationDataProvider: mapsCoUserLocationDataProvider)
        model = AppModel(dependencyContainer: dependencyContainer)
    }
}
