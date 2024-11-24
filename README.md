#  Weather App

This is a small project demonstrating an iOS, iPadOS and macOS app built with modern Apple frameworks - SwiftUI, Combine, Concurrency and Swift Testing.

## Features

The goal of the app is to show the current weather at a provided location. A user can search an address string and the app will present the current weather condition for that location:
- Temperature
- Apparent Temperature
- Wind, including gusts and direction
- Rain
- Cloud Cover

## Weather Data

Weather data is provided by [Open-Meteo's weather API](https://open-meteo.com/en/docs).

## Location Data

Location data is provided by [Maps.Co's geocoding API](https://geocode.maps.co). This API requires an API key - see [Getting Started](#Getting-Started) for more info.

A protocol for providing location data allows [CLGeocoder](https://developer.apple.com/documentation/corelocation/clgeocoder) to be used instead - If an API key secret is not supplied, `CLGeocoder` will be used as a fallback.

# Getting Started

Minimum Xcode Version: 16.0

## API Key Secret

As mentioned previously, the Maps.co API requires an API key. A key is _not_ provided as part of this repository. This is done to avoid it being picked up by online scrapers - it is understood that since the key is a query parameter in the request it will be leaked by the app.

To build the app with a valid API key a `secrets.xcconfig` must be added to the `Weather` target and include the API key as the `MAPS_CO_API_KEY` property e.g.:

```
// secrets.xcconfig
MAPS_CO_API_KEY = [YOUR API KEY HERE]
```
