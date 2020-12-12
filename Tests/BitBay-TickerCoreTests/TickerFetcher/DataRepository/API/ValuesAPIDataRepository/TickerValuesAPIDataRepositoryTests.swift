import XCTest
@testable import BitBay_TickerCore

final class TickerValuesAPIDataRepositoryTests: XCTestCase {
    
    func testNilURL() {
        let tickerValuesAPIDataRepository = TickerValuesAPIDataRepository(endpointFactory: MockEndpointFactoryReturninNilURLs(), networkingService: MockServicetReturningProperData())
        
        let tickerValuesAPIDataResponse = tickerValuesAPIDataRepository.fetchTickerValuesAPIData(tickerIdentifier: "BTC-PLN")
        
        XCTAssertNil(tickerValuesAPIDataResponse)
    }
    
    func testJSONWithAPIError() {
        let tickerValuesAPIDataRepository = TickerValuesAPIDataRepository(endpointFactory: MockEndpointFactoryReturningProperURLs(), networkingService: MockServicetReturningErrorData())
        
        let tickerValuesAPIDataResponse = tickerValuesAPIDataRepository.fetchTickerValuesAPIData(tickerIdentifier: "BTC-PLN2")
        
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

private struct MockServicetReturningErrorData: NetworkingServicePort {

    func fetchData(url: URL) -> Data? {
        let jsonTickerValuesString = """
            {"status":"Fail","errors":["TICKER_NOT_FOUND"]}
        """
        
        return jsonTickerValuesString.data(using: .utf8)
    }
    
}

private struct MockServicetReturningNil: NetworkingServicePort {

    func fetchData(url: URL) -> Data? { nil }

}
