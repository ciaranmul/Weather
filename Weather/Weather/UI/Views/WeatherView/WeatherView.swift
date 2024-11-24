//
//  WeatherView.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

import SwiftUI

struct WeatherView: View {
    @EnvironmentObject var weatherPresenter: WeatherPresenter

    var body: some View {
        switch weatherPresenter.weatherState {
        case .pending:
            EmptyView()
        case .loading:
            ProgressView()
        case .ready(let weatherViewModel):
            WeatherDataView(weatherViewModel: weatherViewModel)
        case let .error(errorMessage):
            ErrorView(errorMessage: errorMessage)
        }
    }
}

#Preview {
    WeatherView()
        .environmentObject(WeatherPresenter(model: StaticAppModel()))
}
