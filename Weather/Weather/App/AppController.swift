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

    private let dependencyContainer: DependencyContainerType
    private let model: AppModel

    init() {
        dependencyContainer = DependencyContainer(weatherDataProvider: StaticWeatherDataProvider(),
                                                  userLocationDataProvider: CLGeocoder())
        model = AppModel(dependencyContainer: dependencyContainer)
    }
}