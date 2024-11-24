//
//  OpenMeteoServiceError.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

enum ServiceProviderError: Error {
    case invalidURL
    case invalidResponse
    case statusCode(Int)
    case underlying(Error)
}
