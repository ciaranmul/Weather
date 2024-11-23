//
//  AppModelType.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

import Combine

protocol AppModelType {
    var weatherState: AnyPublisher<WeatherDataState, Never> { get }
}
