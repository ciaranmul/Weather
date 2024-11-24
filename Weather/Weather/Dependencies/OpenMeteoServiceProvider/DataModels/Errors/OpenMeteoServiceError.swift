//
//  OpenMeteoServiceError.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

enum OpenMeteoServiceError: Error {
    case invalidURL
    case invalidResponse
    case statusCode(Int)
    case underlying(Error)
}
