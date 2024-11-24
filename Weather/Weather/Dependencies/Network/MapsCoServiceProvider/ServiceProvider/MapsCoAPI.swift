//
//  MapsCoAPI.swift
//  Weather
//
//  Created by Ciarán Mulholland on 24/11/2024.
//
import Foundation

enum MapsCoAPI {
    private static let host = "geocode.maps.co"
    private static let scheme = "https"

    case geocode(address: String)

    func endpoint(apiKey: String) -> Endpoint {
        switch self {
        case let .geocode(address):
            Endpoint(scheme: Self.scheme,
                     host: Self.host,
                     path: "/search",
                     queryItems: [
                        URLQueryItem(name: "q", value: address),
                        URLQueryItem(name: "api_key", value: apiKey)
                     ])
        }
    }
}
