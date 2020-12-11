import XCTest
@testable import BitBay_TickerCore

final class TickerTests: XCTestCase {
    
    func testProperBaseCurrency() throws {
        let ticker = getTicker(tickerIdentifier: "BTC-PLN")
        
        XCTAssertEqual("BTC", ticker.baseCurrency)
    }
    
    func testEmptyBaseCurrency() throws {
        let ticker = getTicker(tickerIdentifier: "-PLN")
        
        XCTAssertEqual("", ticker.baseCurrency)
    }
    
    func testProperCounterCurrency() throws {
        let ticker = getTicker(tickerIdentifier: "BTC-PLN")
        
        XCTAssertEqual("PLN", ticker.counterCurrency)
    }
    
    func testEmptyCounterCurrency() throws {
        let ticker = getTicker(tickerIdentifier: "BTC-")
        
        XCTAssertEqual("", ticker.counterCurrency)
    }
    
    // MARK: - Helpers
    
    private func getTicker(tickerIdentifier: String) -> Ticker {
        Ticker(id: tickerIdentifier, highestBid: nil, lowestAsk: nil, rate: nil, previousRate: nil, highestRate: nil, lowestRate: nil, volume: nil, average: nil)
    }
    
}
