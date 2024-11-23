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
        case .loading:
            Text("loading")
        case .ready(let weatherViewModel):
            Text(weatherViewModel.message)
        }
    }
}
