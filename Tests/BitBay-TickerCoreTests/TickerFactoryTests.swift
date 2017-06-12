import XCTest
@testable import BitBay_TickerCore

final class TickerFactoryTests: XCTestCase {
    
    func testMakeTickerWithCorrectName() {
        let ticker = TickerFactory.makeTicker(named: "BTCPLN")!
        
        XCTAssertEqual("BTC", ticker.baseCurrency)
        XCTAssertEqual("PLN", ticker.counterCurrency)
        
        XCTAssertGreaterThan(ticker.max!, 0)
        XCTAssertGreaterThan(ticker.min!, 0)
        XCTAssertGreaterThan(ticker.last!, 0)
        XCTAssertGreaterThan(ticker.bid!, 0)
        XCTAssertGreaterThan(ticker.ask!, 0)
        XCTAssertGreaterThan(ticker.vwap!, 0)
        XCTAssertGreaterThan(ticker.average!, 0)
        XCTAssertGreaterThan(ticker.volume!, 0)
    }
    
    func testMakeTickerWithIncorrectName() {
        let ticker = TickerFactory.makeTicker(named: "BTCPLNN")
        
        XCTAssertNil(ticker)
    }
    
    
    static var allTests = [
        ("testMakeTickerWithCorrectName", testMakeTickerWithCorrectName),
        ("testMakeTickerWithIncorrectName", testMakeTickerWithIncorrectName)
    ]
    
}
