import XCTest
@testable import BitBay_TickerCore

final class TickerFactoryTests: XCTestCase {
    
    func testMakeTicker() {
        let ticker = TickerFactory.makeTicker(named: "BTCPLN")
        
        XCTAssertEqual("BTC", ticker.baseCurrency)
        XCTAssertEqual("PLN", ticker.counterCurrency)
        
        XCTAssertGreaterThan(ticker.max!, 0)
        XCTAssertGreaterThan(ticker.min!, 0)
        XCTAssertGreaterThan(ticker.last!, 0)
        XCTAssertGreaterThan(ticker.last!, 0)
        XCTAssertGreaterThan(ticker.last!, 0)
        XCTAssertGreaterThan(ticker.last!, 0)
        XCTAssertGreaterThan(ticker.last!, 0)
        XCTAssertGreaterThan(ticker.last!, 0)
    }
    
    
    static var allTests = [
        ("testMakeTicker", testMakeTicker)
    ]
    
}
