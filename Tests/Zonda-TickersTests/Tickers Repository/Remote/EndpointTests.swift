import XCTest
@testable import Zonda_Tickers

final class EndpointTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_url() {
        verify(urlString: "https://api.zonda.exchange/rest/trading/ticker", for: .ticker)
        verify(urlString: "https://api.zonda.exchange/rest/trading/stats", for: .stats)
    }
    
    // MARK: - Helpers
    
    private func verify(urlString: String, for endpoint: Endpoint) {
        XCTAssertEqual(URL(string: urlString), endpoint.url)
    }
    
}
