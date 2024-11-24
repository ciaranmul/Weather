//
//  OpenMeteoAPI.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//
import Foundation


struct Endpoint {
    let scheme: String
    let host: String
    let path: String
    let queryItems: [URLQueryItem]

    var url: URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems

        return components.url
    }
}

enum OpenMeteoAPI {
    private static let host = "api.open-meteo.com"
    private static let scheme = "https"

    case forecast(latitude: Double, longitude: Double)

    var endpoint: Endpoint {
        switch self {
        case let .forecast(latitude, longitude):
            Endpoint(scheme: Self.scheme,
                     host: Self.host,
                     path: "/v1/forecast",
                     queryItems: [
                        URLQueryItem(name: "latitude", value: latitude.toString),
                        URLQueryItem(name: "longitude", value: longitude.toString),
                        URLQueryItem(name: "wind_speed_unit", value: "mph"),
                        URLQueryItem(name: "current", value: "temperature_2m,apparent_temperature,rain,cloud_cover,wind_speed_10m,wind_direction_10m,wind_gusts_10m")
                     ])
        }
    }
}

extension Double {
    var toString: String {
        String(format: "%.5f", self)
    }
}
