import XCTest
@testable import BitBay_TickerCore

final class TickerValuesAPIDataRepositoryTests: XCTestCase {
    
    func testNilURL() {
        let tickerValuesAPIDataRepository = TickerValuesAPIDataRepository(endpointFactory: MockEndpointFactoryReturninNilURLs(), networkingService: MockServicetReturningProperData())
        
        let tickerValuesAPIDataResponse = tickerValuesAPIDataRepository.fetchTickerValuesAPIData(tickerIdentifier: "BTC-PLN")
        
        XCTAssertNil(tickerValuesAPIDataResponse)
    }
    
    func testNilJSONData() {
        let tickerValuesAPIDataRepository = TickerValuesAPIDataRepository(endpointFactory: MockEndpointFactoryReturningProperURLs(), networkingService: MockServicetReturningNil())
        
        let tickerValuesAPIDataResponse = tickerValuesAPIDataRepository.fetchTickerValuesAPIData(tickerIdentifier: "BTC-PLN")
        
        XCTAssertNil(tickerValuesAPIDataResponse)
    }
    
    func testReturningTickerValuesAPIDataResponse() {
        let tickerValuesAPIDataRepository = TickerValuesAPIDataRepository(endpointFactory: MockEndpointFactoryReturningProperURLs(), networkingService: MockServicetReturningProperData())
        
        let tickerValuesAPIDataResponse = tickerValuesAPIDataRepository.fetchTickerValuesAPIData(tickerIdentifier: "BTC-PLN")
        
        XCTAssertNotNil(tickerValuesAPIDataResponse)
    }
    
}

// MARK: - Helpers

private struct MockServicetReturningProperData: NetworkingServicePort {

    func fetchData(url: URL) -> Data? {
        let jsonTickerValuesString = """
            {"status":"Ok","ticker":{"market":{"code":"BTC-PLN","first":{"currency":"BTC","minOffer":"1","scale":8},"second":{"currency":"PLN","minOffer":"5","scale":2}},"time":"1607714264576","highestBid":"1","lowestAsk":"2","rate":"3","previousRate":"4"}}
        """
        
        return jsonTickerValuesString.data(using: .utf8)
    }
    
}

private struct MockServicetReturningNil: NetworkingServicePort {

    func fetchData(url: URL) -> Data? { nil }

}

private struct MockEndpointFactoryReturningProperURLs: EndpointFactoryPort {
    
    func makeValuesURL(for tickerIdentifier: String) -> URL? { URL(string: "https://values.test") }
    func makeStatsURL(for tickerIdentifier: String) -> URL? { URL(string: "https://stats.test") }
    
}

private struct MockEndpointFactoryReturninNilURLs: EndpointFactoryPort {
    
    func makeValuesURL(for tickerIdentifier: String) -> URL? { nil }
    func makeStatsURL(for tickerIdentifier: String) -> URL? { nil }
    
}


