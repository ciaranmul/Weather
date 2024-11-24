//
//  WeatherPresenter.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//
import SwiftUI

final class WeatherPresenter: ObservableObject {
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
    var toViewState: WeatherViewState {
        switch self {
        case let .success(data):
            .ready(data.toWeatherViewModel)
        case .pending, .fetching, .failure:
            .loading
        }
    }
}

private extension WeatherData {
    var toWeatherViewModel: WeatherViewModel {
        .init(temperature: String(format: "%.1f", temperature.value) + temperature.unit,
              apparentTemperature: String(format: "%.1f", apparentTemperature.value) + apparentTemperature.unit,
              windSpeed: "\(String(format: "%.1f", windSpeed.value))\(windSpeed.unit) (Gusts up to \(String(format: "%.1f", windGusts.value))\(windGusts.unit))",
              windDirection: String(format: "%.1f", windDirection.value) + windDirection.unit,
              rain: String(format: "%.1f", rain.value) + rain.unit,
              cloudCover: String(format: "%.1f", cloudCover.value) + cloudCover.unit)
    }
}
