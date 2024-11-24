//
//  Endpoint.swift
//  Weather
//
//  Created by Ciarán Mulholland on 24/11/2024.
//
import Foundation

struct Endpoint {
    let scheme: String
    let host: String
    let path: String
    let queryItems: [URLQueryItem]

    /// Returns a URL object constructed by the properties of the Endpoint
    var url: URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems

        return components.url
    }
}
