//
//  Configuration.swift
//  Weather
//
//  Created by Ciarán Mulholland on 24/11/2024.
//
import Foundation

/// Configuration is a namespace providing a function to get values from the Bundle's info dictionary.
// This is an enum so that the `value(for:)` function can be namespaced without it being possible to instantiate a `Configuration` object.
enum Configuration {
    enum Error: Swift.Error {
        case missingKey, invalidValue
    }

    /// Get the value from the info dictionary for a provided key
    ///
    /// - Parameters:
    ///     - key: The key for the value to be fetched
    /// - Returns: The value for the provided key
    /// - Throws: When a value for the key cannot be found or when the key is missing
    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey:key) else {
            throw Error.missingKey
        }

        switch object {
        case let value as T:
            return value
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
        default:
            throw Error.invalidValue
        }
    }
}
