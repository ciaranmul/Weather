//
//  WeatherApp.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

import SwiftUI

@main
struct WeatherApp: App {
    let controller = AppController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(controller.weatherPresenter)
                .environmentObject(controller.locationPresenter)
        }
    }
}
