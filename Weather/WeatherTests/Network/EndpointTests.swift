//
//  EndpointTests.swift
//  Weather
//
//  Created by Ciarán Mulholland on 24/11/2024.
//

import Foundation
import Testing
@testable import Weather

struct EndpointTests {
    @Test func url() async throws {
        let subject = Endpoint(scheme: "https",
                               host: "host.com",
                               path: "/path",
                               queryItems: [
                                .init(name: "query", value: "value"),
                                .init(name: "nilValueQuery", value: nil)
                               ])

        let url = try #require(subject.url)
        #expect(url.absoluteString == "https://host.com/path?query=value&nilValueQuery")
    }
}
