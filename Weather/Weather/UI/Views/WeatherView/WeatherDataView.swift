//
//  WeatherDataView.swift
//  Weather
//
//  Created by Ciarán Mulholland on 24/11/2024.
//
import SwiftUI

struct WeatherDataView: View {
    let weatherViewModel: WeatherViewModel

    var body: some View {
        VStack() {
            VStack {
                Text(weatherViewModel.temperature)
                    .font(.largeTitle)
                Text("Feels Like: \(weatherViewModel.apparentTemperature)")
            }

            Divider()

            VStack(alignment: .leading) {
                Label(weatherViewModel.rain, systemImage: "cloud.rain")
                Label(weatherViewModel.windSpeed, systemImage: "wind")
                Label(weatherViewModel.windDirection, systemImage: "arrow.up.right")
                Label(weatherViewModel.cloudCover, systemImage: "cloud")
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(.white)
                .opacity(0.5)
        )
    }
}
