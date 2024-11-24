//
//  AppController.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//


import CoreLocation

/// The application controller is responsible for creating the dependencies, app model and for providing the presenter objects that will be injected into the SwiftUI environment
final class AppController {
    /// Weather presenter instance, used to provide a connection between the app's weather view and the domain layer
    lazy var weatherPresenter: WeatherPresenter = {
        WeatherPresenter(model: model)
    }()

    /// Location presenter instance, used to provide a connection between the app's location view and the domain layer
    lazy var locationPresenter: LocationPresenter = {
        LocationPresenter(model: model)
    }()

    private let dependencyContainer: DependencyContainerType
    private let model: AppModel

    /// Creates an `AppController` instance.
    ///
    /// The `AppController` is used to instantiate the dependency container and the model responsible for the app's business logic. The `AppController` provides the Environment Objects used to bridge the View layer and the Domain layer.
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
