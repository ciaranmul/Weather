//
//  LocationPresenter.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

import SwiftUI

final class LocationPresenter: ObservableObject {
    private let model: AppModelType

    init(model: AppModelType) {
        self.model = model
    }

    func submit(_ addressString: String) {
        model.addressSubmitted(addressString)
    }
}
