import XCTest
@testable import BitBay_TickerCore

final class TickerTests: XCTestCase {
    
    func testBaseCurrency() {
        let ticker1 = Ticker(name: "BTC/PLN")
        XCTAssertEqual("BTC", ticker1.baseCurrency)
        
        let ticker2 = Ticker(name: "btC/PlN")
        XCTAssertEqual("BTC", ticker2.baseCurrency)
        
        let ticker3 = Ticker(name: "BTCPLN")
        XCTAssertNil(ticker3.baseCurrency)
    }
    
    func testCounterCurrency() {
        let ticker1 = Ticker(name: "BTC/PLN")
        XCTAssertEqual("PLN", ticker1.counterCurrency)
        
        let ticker2 = Ticker(name: "btC/PlN")
        XCTAssertEqual("PLN", ticker2.counterCurrency)
        
        let ticker3 = Ticker(name: "BTCPLN")
        XCTAssertNil(ticker3.counterCurrency)
    }
    
    func testAPITickerName() {
        let ticker1 = Ticker(name: "BTC/PLN")
        XCTAssertEqual("BTCPLN", ticker1.apiTickerName)
        
        let ticker2 = Ticker(name: "btC/PlN")
        XCTAssertEqual("BTCPLN", ticker2.apiTickerName)
        
        let ticker3 = Ticker(name: "BTCPLN")
        XCTAssertNil(ticker3.apiTickerName)
    }
    
    func testSetUpValues() {
        var ticker = Ticker(name: "BTC/PLN")
        XCTAssertNil(ticker.max)
        XCTAssertNil(ticker.min)
        XCTAssertNil(ticker.last)
        XCTAssertNil(ticker.bid)
        XCTAssertNil(ticker.ask)
        XCTAssertNil(ticker.vwap)
        XCTAssertNil(ticker.average)
        XCTAssertNil(ticker.volume)
        
        ticker.setUpValues(using: TickerValuesAPIResponse(max: 1, min: 2, last: 3, bid: 4, ask: 5, vwap: 6, average: 7, volume: 8))
        
        XCTAssertEqual(1, ticker.max)
        XCTAssertEqual(2, ticker.min)
        XCTAssertEqual(3, ticker.last)
        XCTAssertEqual(4, ticker.bid)
        XCTAssertEqual(5, ticker.ask)
        XCTAssertEqual(6, ticker.vwap)
        XCTAssertEqual(7, ticker.average)
        XCTAssertEqual(8, ticker.volume)
    }
    
    func testDescriptionPrintArguments() {
        var ticker = Ticker(name: "BTC/PLN")
        ticker.setUpValues(using: TickerValuesAPIResponse(max: 1, min: 2, last: 3, bid: 4, ask: 5, vwap: 6, average: 7, volume: 8))
        
        XCTAssertEqual("Ticker BTC/PLN, max: 1.0 PLN, min: 2.0 PLN, last: 3.0 PLN, bid: 4.0 PLN, ask: 5.0 PLN, vwap: 6.0 PLN, average: 7.0 PLN, volume: 8.0", ticker.description(printArguments: []))

        XCTAssertEqual("Ticker BTC/PLN, max: 1.0 PLN", ticker.description(printArguments: ["--max"]))
        XCTAssertEqual("Ticker BTC/PLN, min: 2.0 PLN", ticker.description(printArguments: ["--min"]))
        XCTAssertEqual("Ticker BTC/PLN, last: 3.0 PLN", ticker.description(printArguments: ["--last"]))
        XCTAssertEqual("Ticker BTC/PLN, bid: 4.0 PLN", ticker.description(printArguments: ["--bid"]))
        XCTAssertEqual("Ticker BTC/PLN, ask: 5.0 PLN", ticker.description(printArguments: ["--ask"]))
        XCTAssertEqual("Ticker BTC/PLN, vwap: 6.0 PLN", ticker.description(printArguments: ["--vwap"]))
        XCTAssertEqual("Ticker BTC/PLN, average: 7.0 PLN", ticker.description(printArguments: ["--average"]))
        XCTAssertEqual("Ticker BTC/PLN, volume: 8.0", ticker.description(printArguments: ["--volume"]))

        XCTAssertEqual("Ticker BTC/PLN", ticker.description(printArguments: ["last"]))
        XCTAssertEqual("Ticker BTC/PLN, max: 1.0 PLN, last: 3.0 PLN", ticker.description(printArguments: ["--max", "--last"]))
    }
    
    static var allTests = [
        ("testBaseCurrency", testBaseCurrency),
        ("testCounterCurrency", testCounterCurrency),
        ("testAPITickerName", testAPITickerName),
        ("testSetUpValues", testSetUpValues),
        ("testDescriptionPrintArguments", testDescriptionPrintArguments)
    ]

}
