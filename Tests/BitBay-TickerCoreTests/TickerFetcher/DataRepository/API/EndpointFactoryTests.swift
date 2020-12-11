import XCTest
@testable import BitBay_TickerCore

final class EndpointFactoryTests: XCTestCase {

    func testValuesEndpoint() throws {
        let endpointFactory = EndpointFactory()
        
        let endpoint = endpointFactory.makeValuesURL(for: "BTC-PLN")
        
        XCTAssertEqual(URL(string: "https://api.bitbay.net/rest/trading/ticker/BTC-PLN"), endpoint)
    }
    
    func testStatsEndpoint() throws {
        let endpointFactory = EndpointFactory()
        
        let endpoint = endpointFactory.makeStatsURL(for: "BTC-PLN")
        
        XCTAssertEqual(URL(string: "https://api.bitbay.net/rest/trading/stats/BTC-PLN"), endpoint)
    }

}
