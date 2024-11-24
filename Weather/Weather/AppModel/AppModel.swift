//
//  AppModel.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

import Combine

/// Concrete implementation of the `AppModelType` protocol to be used by the App target.
final class AppModel: AppModelType {

    // MARK: - Internal Types

    /// Describes the dependencies required by the App Model
    typealias Dependencies = HasWeatherDataProvider & HasUserLocationDataProvider

    // MARK: - Internal Properties

    /// Publishes the latest weather data state
    var weatherState: AnyPublisher<WeatherDataState, Never> {
        _weatherState.eraseToAnyPublisher()
    }

    // MARK: - Dependencies

    private let weatherDataProvider: WeatherDataProviderType
    private let userLocationDataProvider: UserLocationDataProviderType

    // MARK: - Private Properties

    private let _weatherState = CurrentValueSubject<WeatherDataState, Never>(.pending)
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Initialisers

    /// Initialises an AppModel object
    /// - Parameters:
    ///     - dependencyContainer: Container for the dependencies required by the App Model
    init(dependencyContainer: Dependencies) {
        weatherDataProvider = dependencyContainer.weatherDataProvider
        userLocationDataProvider = dependencyContainer.userLocationDataProvider
    }

    // MARK: - Internal Functions

    /// Submitting an address updates the weather state to reflect that address
    ///
    /// Triggers calls to geocode the provided address string and fetch weather data based on the geocoded address. The weather data state is updated to reflect the state of this update.
    ///
    /// - Parameters:
    ///     - address: The new address for which the app should display the current weather.
    func addressSubmitted(_ address: String) {
        _weatherState.send(.fetching)

        Task {
            do {
                let location = try await userLocationDataProvider.getLocation(for: address)
                let weatherData = try await weatherDataProvider.getWeatherData(for: location)
                await MainActor.run {
                    _weatherState.send(.success(weatherData))
                }
            } catch {
                await MainActor.run {
                    _weatherState.send(.failure(error))
                }
            }
        }
    }
}
