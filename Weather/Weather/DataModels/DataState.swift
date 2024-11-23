//
//  DataState.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//


enum DataState<T> {
    case pending
    case fetching
    case success(T)
    case failure(Error)
}

extension DataState {
    var data: T? {
        switch self {
        case .failure, .fetching, .pending:
            nil
        case let .success(data):
            data
        }
    }
}
