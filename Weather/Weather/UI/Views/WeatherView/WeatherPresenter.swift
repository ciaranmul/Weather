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
            .ready(.init(temperature: data.temperature,
                         apparentTemperature: data.apparentTemperature,
                         wind: data.wind,
                         rain: data.rain,
                         cloudCover: data.cloudCover))
        case .pending, .fetching, .failure:
            .loading
        }
    }
}
