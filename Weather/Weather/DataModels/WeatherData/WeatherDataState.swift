//
//  WeatherDataState.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

enum WeatherDataState {
    case pending
    case fetching
    case success(WeatherData)
    case failure(Error)
}
