//
//  SearchResult.swift
//  Weather
//
//  Created by Ciarán Mulholland on 24/11/2024.
//

/// Describes the expected Search Result object to be returned from the service
struct SearchResult: Decodable {
    let placeId: Int
    let licence: String
    let osmType: String
    let osmId: Int
    let boundingbox: [String]
    let lat: String
    let lon: String
    let displayName: String
    let `class`: String
    let type: String
    let importance: Float
}
