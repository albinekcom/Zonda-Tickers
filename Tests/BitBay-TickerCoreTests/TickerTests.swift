import XCTest
@testable import BitBay_TickerCore

final class TickerTests: XCTestCase {
    
    func testBaseCurrency() {
        let ticker1 = Ticker(id: "BTC-PLN")
        XCTAssertEqual("BTC", ticker1.baseCurrency)
        
        let ticker2 = Ticker(id: "btC-PlN")
        XCTAssertEqual("BTC", ticker2.baseCurrency)
    }
    
    func testCounterCurrency() {
        let ticker1 = Ticker(id: "BTC-PLN")
        XCTAssertEqual("PLN", ticker1.counterCurrency)
        
        let ticker2 = Ticker(id: "btC-PlN")
        XCTAssertEqual("PLN", ticker2.counterCurrency)
    }
    
    func testIsAnyValueFilled() {
        var ticker = Ticker(id: "BTC-PLN")
        
        XCTAssertFalse(ticker.isAnyValueFilled)
        
        ticker.highestBid = 1.1
        ticker.lowestAsk = 2.2
        ticker.rate = 3.3
        
        XCTAssertTrue(ticker.isAnyValueFilled)
        
        ticker.previousRate = 4.4
        
        XCTAssertTrue(ticker.isAnyValueFilled)
    }
    
    func testSetUpValues() {
        var ticker = Ticker(id: "BTC-PLN")

        XCTAssertNil(ticker.highestBid)
        XCTAssertNil(ticker.lowestAsk)
        XCTAssertNil(ticker.rate)
        XCTAssertNil(ticker.previousRate)

        ticker.setUpValues(using: TickerValuesAPIResponse(status: nil, ticker: TickerValuesAPIResponse.TickerAPIResponse(market: nil, time: nil, highestBid: "1.1", lowestAsk: "2.2", rate: "3.3", previousRate: "4.4")))

        XCTAssertEqual(1.1, ticker.highestBid)
        XCTAssertEqual(2.2, ticker.lowestAsk)
        XCTAssertEqual(3.3, ticker.rate)
        XCTAssertEqual(4.4, ticker.previousRate)
        
        XCTAssertTrue(true)
    }
    
    func testDescriptionPrintArguments() {
        var ticker = Ticker(id: "BTC-PLN")
        ticker.highestBid = 1.1
        ticker.lowestAsk = 2.2
        ticker.rate = 3.3
        ticker.previousRate = 4.4
        
        XCTAssertEqual("Ticker BTC-PLN, highest bid: 1.1 PLN, lowest ask: 2.2 PLN, rate: 3.3 PLN, previous rate: 4.4 PLN", ticker.description(printArguments: []))

        XCTAssertEqual("Ticker BTC-PLN, highest bid: 1.1 PLN", ticker.description(printArguments: ["--highestBid"]))
        XCTAssertEqual("Ticker BTC-PLN, lowest ask: 2.2 PLN", ticker.description(printArguments: ["--lowestAsk"]))
        XCTAssertEqual("Ticker BTC-PLN, rate: 3.3 PLN", ticker.description(printArguments: ["--rate"]))
        XCTAssertEqual("Ticker BTC-PLN, previous rate: 4.4 PLN", ticker.description(printArguments: ["--previousRate"]))

        XCTAssertEqual("Ticker BTC-PLN", ticker.description(printArguments: ["rate"]))
        XCTAssertEqual("Ticker BTC-PLN, highest bid: 1.1 PLN, rate: 3.3 PLN", ticker.description(printArguments: ["--highestBid", "--rate"]))
    }
    
    static var allTests = [
        ("testBaseCurrency", testBaseCurrency),
        ("testCounterCurrency", testCounterCurrency),
        ("testIsAnyValueFilled", testIsAnyValueFilled),
        ("testSetUpValues", testSetUpValues),
        ("testDescriptionPrintArguments", testDescriptionPrintArguments)
    ]

}
