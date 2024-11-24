//
//  OpenMeteoServiceError.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

enum ServiceProviderError: Error {
    /// The URL is in an invalid format
    case invalidURL
    /// The response is in an invalid format
    case invalidResponse
    /// A non-success status code has been returned
    /// - Parameters:
    ///     - statusCode: The returned status code
    case statusCode(Int)
    /// some underlying error has occurred
    /// - Parameters:
    ///     - error: The underlying error
    case underlying(Error)
}
