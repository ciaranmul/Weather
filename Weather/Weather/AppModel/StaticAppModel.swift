//
//  StaticAppModel.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

import SwiftUI
import Combine

struct StaticAppModel: AppModelType {
    var weatherState: AnyPublisher<WeatherDataState, Never> {
        Just(.success(.fixture)).eraseToAnyPublisher()
    }

    func addressSubmitted(_ address: String) { }
}
