//
//  DataState.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

/// Represents the state of remotely sourced data
enum DataState<T> {
    case pending
    case fetching
    case success(T)
    case failure(Error)
}
