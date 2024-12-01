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
                    .accessibilityIdentifier("temperature_label")
                Text("Feels Like: \(weatherViewModel.apparentTemperature)")
                    .accessibilityIdentifier("feels_like_label")
            }

            Divider()

            VStack(alignment: .leading) {
                Label(weatherViewModel.rain, systemImage: "cloud.rain")
                    .accessibilityIdentifier("rain_label")
                Label(weatherViewModel.windSpeed, systemImage: "wind")
                    .accessibilityIdentifier("wind_speed_label")
                Label(weatherViewModel.windDirection, systemImage: "arrow.up.right")
                    .accessibilityIdentifier("wind_direction_label")
                Label(weatherViewModel.cloudCover, systemImage: "cloud")
                    .accessibilityIdentifier("cloud_cover_label")
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
