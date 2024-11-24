//
//  WeatherPresenter.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//
import SwiftUI

/// The `WeatherPresenter` facilitates interaction between the `WeatherView` and the domain layer.
///
/// The presenter publishes a state which reflects whether or not the information is available. The success state includes the view data to be rendered.
final class WeatherPresenter: ObservableObject {
    /// Publishes the state of the weather information
    ///
    /// When the state is success, the weather information is provided as a view model
    @Published
    var weatherState: WeatherViewState = .loading

    private let model: AppModelType

    init(model: AppModelType) {
        self.model = model
        setupBindings()
    }

    private func setupBindings() {
        model
            .weatherState
            .map {
                $0.toViewState
            }
            .assign(to: &$weatherState)
    }
}

private extension WeatherDataState {
    /// Maps the domain layer weather data state to the state which the view should represent
    var toViewState: WeatherViewState {
        switch self {
        case .pending:
            .pending
        case let .success(data):
            .ready(data.toWeatherViewModel)
        case .fetching:
            .loading
        case let .failure(error):
            .error(error.localizedDescription)
        }
    }
}

private extension WeatherData {
    /// Maps the domain layer weather data to a UI layer view model
    var toWeatherViewModel: WeatherViewModel {
        .init(temperature: String(format: "%.1f", temperature.value) + temperature.unit,
              apparentTemperature: String(format: "%.1f", apparentTemperature.value) + apparentTemperature.unit,
              windSpeed: "\(String(format: "%.1f", windSpeed.value))\(windSpeed.unit) (Gusts up to \(String(format: "%.1f", windGusts.value))\(windGusts.unit))",
              windDirection: String(format: "%.1f", windDirection.value) + windDirection.unit,
              rain: String(format: "%.1f", rain.value) + rain.unit,
              cloudCover: String(format: "%.1f", cloudCover.value) + cloudCover.unit)
    }
}
