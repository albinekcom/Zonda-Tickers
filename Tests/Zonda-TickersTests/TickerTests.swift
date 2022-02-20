import XCTest
@testable import Zonda_Tickers

final class TickerTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_baseCurrencyId() {
        XCTAssertEqual("btc", ticker(tickerId: "btc-pln").baseCurrencyId)
        XCTAssertNil(ticker(tickerId: "btc/pln").baseCurrencyId)
        XCTAssertNil(ticker(tickerId: "btc").baseCurrencyId)
        XCTAssertNil(ticker(tickerId: "btc-").baseCurrencyId)
    }

    func test_counterCurrencyId() {
        XCTAssertEqual("pln", ticker(tickerId: "btc-pln").counterCurrencyId)
        XCTAssertNil(ticker(tickerId: "btc/pln").counterCurrencyId)
        XCTAssertNil(ticker(tickerId: "btc").counterCurrencyId)
        XCTAssertNil(ticker(tickerId: "-btc").counterCurrencyId)
    }
    
    // MARK: - Helpers
    
    private func ticker(tickerId: String) -> Ticker {
        .init(id: tickerId,
              counterCurrencyScale: 0,
              highestBid: nil,
              lowestAsk: nil,
              rate: nil,
              previousRate: nil,
              highestRate: nil,
              lowestRate: nil,
              volume: nil,
              average: nil)
    }

}
