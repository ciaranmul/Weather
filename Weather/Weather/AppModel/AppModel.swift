//
//  AppModel.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

import Combine

final class AppModel: AppModelType {

    // MARK: - Internal Properties

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

    init(dependencyContainer: DependencyContainerType) {
        weatherDataProvider = dependencyContainer.weatherDataProvider
        userLocationDataProvider = dependencyContainer.userLocationDataProvider
    }

    // MARK: - Internal Functions

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
