//
//  ContentView.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            LocationView()
            WeatherView()
            Spacer()
        }
        .padding()
        .background(Gradient(colors: [.blue, .white]))
    }
}

#Preview {
    ContentView()
        .environmentObject(WeatherPresenter(model: StaticAppModel()))
        .environmentObject(LocationPresenter(model: StaticAppModel()))
}
