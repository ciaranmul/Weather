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

    /// Geocodes the provided address string
    case geocode(address: String)

    /// Returns an object describing the endpoint associated with the enum case
    /// - Parameters:
    ///     - apiKey: The API requires an API key, to be provided here
    /// - Returns: The endpoint for the enum case, using the provided API key
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
