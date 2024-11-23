//
//  UserLocationProviderType.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

import Combine

protocol UserLocationDataProviderType {
    func getLocation(for address: String) async throws -> Location
}
