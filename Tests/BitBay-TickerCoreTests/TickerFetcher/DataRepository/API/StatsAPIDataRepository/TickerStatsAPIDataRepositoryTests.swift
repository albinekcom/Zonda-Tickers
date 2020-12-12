import XCTest
@testable import BitBay_TickerCore

final class TickerStatsAPIDataRepositoryTests: XCTestCase {
    
    func testNilURL() {
        let tickerStatsAPIDataRepository = TickerStatsAPIDataRepository(endpointFactory: MockEndpointFactoryReturninNilURLs(), networkingService: MockServicetReturningProperData())
        
        let tickerStatsAPIDataResponse = tickerStatsAPIDataRepository.fetchTickerStatsAPIData(tickerIdentifier: "BTC-PLN")
        
        XCTAssertNil(tickerStatsAPIDataResponse)
    }
    
    func testNilJSONData() {
        let tickerStatsAPIDataRepository = TickerStatsAPIDataRepository(endpointFactory: MockEndpointFactoryReturningProperURLs(), networkingService: MockServicetReturningNil())
        
        let tickerStatsAPIDataResponse = tickerStatsAPIDataRepository.fetchTickerStatsAPIData(tickerIdentifier: "BTC-PLN")
        
        XCTAssertNil(tickerStatsAPIDataResponse)
    }
    
    func testJSONWithAPIError() {
        let tickerStatsAPIDataRepository = TickerStatsAPIDataRepository(endpointFactory: MockEndpointFactoryReturningProperURLs(), networkingService: MockServicetReturningErrorData())
        
        let tickerStatsAPIDataResponse = tickerStatsAPIDataRepository.fetchTickerStatsAPIData(tickerIdentifier: "BTC-PLN2")
        
        XCTAssertNil(tickerStatsAPIDataResponse)
    }
    
    func testReturningTickerStatsAPIDataResponse() {
        let tickerStatsAPIDataRepository = TickerStatsAPIDataRepository(endpointFactory: MockEndpointFactoryReturningProperURLs(), networkingService: MockServicetReturningProperData())
        
        let tickerStatsAPIDataResponse = tickerStatsAPIDataRepository.fetchTickerStatsAPIData(tickerIdentifier: "BTC-PLN")
        
        XCTAssertNotNil(tickerStatsAPIDataResponse)
    }
    
}

// MARK: - Helpers

private struct MockServicetReturningProperData: NetworkingServicePort {

    func fetchData(url: URL) -> Data? {
        let jsonTickerValuesString = """
            {"status":"Ok","stats":{"m":"BTC-PLN","h":"1","l":"2","v":"3","r24h":"4"}}
        """
        
        return jsonTickerValuesString.data(using: .utf8)
    }
    
}

private struct MockServicetReturningErrorData: NetworkingServicePort {

    func fetchData(url: URL) -> Data? {
        let jsonTickerValuesString = """
            {"status":"Fail","errors":["STATS_COULD_NOT_BE_LOADED"]}
        """
        
        return jsonTickerValuesString.data(using: .utf8)
    }
    
}

private struct MockServicetReturningNil: NetworkingServicePort {

    func fetchData(url: URL) -> Data? { nil }

}
