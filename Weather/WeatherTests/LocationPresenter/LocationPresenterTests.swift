//
//  LocationPresenterTests.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

import Testing
@testable import Weather

struct LocationPresenterTests {
    let mockModel: MockAppModel
    let subject: LocationPresenter

    init() {
        mockModel = MockAppModel()
        subject = LocationPresenter(model: mockModel)
    }

    @Test(arguments: [
        "",
        "123 some street"
    ]) func submit(address: String) async throws {
        subject.submit(address)
        #expect(mockModel.submittedAddresses.contains(address))
    }
}
