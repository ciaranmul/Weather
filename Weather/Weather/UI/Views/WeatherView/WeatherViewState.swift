//
//  WeatherViewState.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//


enum WeatherViewState {
    case loading
    case ready(WeatherViewModel)
}