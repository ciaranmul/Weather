//
//  MapsCoAPITests.swift
//  Weather
//
//  Created by Ciarán Mulholland on 24/11/2024.
//

import Testing
@testable import Weather

struct MapsCoAPITests {
    @Test func geocodeEndpoint() async throws {
        let subject = MapsCoAPI.geocode(address: "123 some street, some town")
        let endpoint = subject.endpoint(apiKey: "1234")
        #expect(endpoint.host == "geocode.maps.co")
        #expect(endpoint.scheme == "https")
        #expect(endpoint.path == "/search")
        #expect(endpoint.queryItems.contains(.init(name: "q", value: "123 some street, some town")))
        #expect(endpoint.queryItems.contains(.init(name: "api_key", value: "1234")))
    }
}
