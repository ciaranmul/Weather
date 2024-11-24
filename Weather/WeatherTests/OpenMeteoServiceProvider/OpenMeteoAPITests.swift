//
//  OpenMeteoAPITests.swift
//  Weather
//
//  Created by Ciarán Mulholland on 24/11/2024.
//
import Testing
@testable import Weather

struct OpenMeteoAPITests {
    @Test func forecastEndpoint() async throws {
        let subject = OpenMeteoAPI.forecast(latitude: 1.23, longitude: 3.21)
        let endpoint = subject.endpoint
        #expect(endpoint.host == "api.open-meteo.com")
        #expect(endpoint.scheme == "https")
        #expect(endpoint.path == "/v1/forecast")
        #expect(endpoint.queryItems.contains(.init(name: "latitude", value: "1.23000")))
        #expect(endpoint.queryItems.contains(.init(name: "longitude", value: "3.21000")))
        #expect(endpoint.queryItems.contains(.init(name: "wind_speed_unit", value: "mph")))
        #expect(endpoint.queryItems.contains(.init(name: "current", value: "temperature_2m,apparent_temperature,rain,cloud_cover,wind_speed_10m,wind_direction_10m,wind_gusts_10m")))
    }
}
