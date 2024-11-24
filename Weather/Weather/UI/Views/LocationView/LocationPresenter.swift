//
//  LocationPresenter.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

import SwiftUI

/// The `LocationPresenter` facilitates interaction between the `LocationView` and the domain layer.
///
/// Location provider is responsible for capturing user input and sending it to the App Model to be processed.
final class LocationPresenter: ObservableObject {
    private let model: AppModelType

    /// Creates a `LocationPresenter` instance
    /// - Parameters:
    ///     - model: An App Model which will receive input from the presenter
    init(model: AppModelType) {
        self.model = model
    }

    /// Submits user address input to the app model
    func submit(_ addressString: String) {
        model.addressSubmitted(addressString)
    }
}
