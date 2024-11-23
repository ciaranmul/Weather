//
//  AppModelType.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

import Combine

protocol HasUserLocationProvider {
    var userLocationProvider: UserLocationProviderType { get }
}

protocol UserLocationProviderType {
    var location: AnyPublisher<Location, Never> { get }
}

typealias DependencyContainerType = HasWeatherDataProvider & HasUserLocationProvider

struct DependencyContainer: DependencyContainerType {
    var weatherDataProvider: WeatherDataProviderType
    var userLocationProvider: UserLocationProviderType
}

protocol AppModelType {
    var weatherState: AnyPublisher<WeatherDataState, Never> { get }
}

final class AppModel: AppModelType {

    // MARK: - Internal Properties

    var weatherState: AnyPublisher<WeatherDataState, Never> {
        _weatherState.eraseToAnyPublisher()
    }

    // MARK: - Dependencies

    private let weatherDataProvider: WeatherDataProviderType
    private let userLocationProvider: UserLocationProviderType
    
    // MARK: - Private Properties

    private let _weatherState = CurrentValueSubject<WeatherDataState, Never>(.pending)
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Initialisers

    init(dependencyContainer: DependencyContainerType) {
        weatherDataProvider = dependencyContainer.weatherDataProvider
        userLocationProvider = dependencyContainer.userLocationProvider
        
        setupBindings()
    }

    // MARK: - Private Functions

    private func setupBindings() {
        setupLocationChangedBindings()
    }

    private func setupLocationChangedBindings() {
        userLocationProvider
            .location
            .removeDuplicates()
            .sink { [weak self] location in
                self?.updateWeather(with: location)
            }
            .store(in: &cancellables)
    }

    private func updateWeather(with location: Location) {
        _weatherState.send(.fetching)

        Task {
            do {
                let weatherData = try await weatherDataProvider.getWeatherData(for: location)
                _weatherState.send(.success(weatherData))
            } catch {
                _weatherState.send(.failure(error))
            }
        }
    }
}
