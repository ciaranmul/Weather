//
//  DependencyContainerType.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

/// Describes the dependencies that should be included in a dependency container
typealias DependencyContainerType = HasWeatherDataProvider & HasUserLocationDataProvider
