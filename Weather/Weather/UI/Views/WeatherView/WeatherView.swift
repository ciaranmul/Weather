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
            VStack() {
                VStack {
                    Text(weatherViewModel.temperature)
                        .font(.largeTitle)
                    Text("Feels Like: \(weatherViewModel.apparentTemperature)")
                }

                VStack {
                    Label(weatherViewModel.rain, systemImage: "cloud.rain")
                    Label(weatherViewModel.wind, systemImage: "wind")
                    Label(weatherViewModel.cloudCover, systemImage: "cloud")
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.gray)
                        .opacity(0.5)
                )
            }
        }
    }
}

#Preview {
    WeatherView()
        .environmentObject(WeatherPresenter(model: StaticAppModel()))
}
