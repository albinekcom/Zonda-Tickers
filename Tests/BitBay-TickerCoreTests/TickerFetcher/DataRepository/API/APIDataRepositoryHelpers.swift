import XCTest
@testable import BitBay_TickerCore

struct MockEndpointFactoryReturningProperURLs: EndpointFactoryPort {
    
    func makeValuesURL(for tickerIdentifier: String) -> URL? { URL(string: "https://values.test") }
    func makeStatsURL(for tickerIdentifier: String) -> URL? { URL(string: "https://stats.test") }
    
}

struct MockEndpointFactoryReturninNilURLs: EndpointFactoryPort {
    
    func makeValuesURL(for tickerIdentifier: String) -> URL? { nil }
    func makeStatsURL(for tickerIdentifier: String) -> URL? { nil }
    
}
