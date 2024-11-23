//
//  UserLocationProviderType.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

import Combine

protocol UserLocationProviderType {
    var location: AnyPublisher<Location, Never> { get }
}
