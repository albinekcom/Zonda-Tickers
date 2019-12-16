import XCTest
@testable import BitBay_TickerCore

final class TickerTests: XCTestCase {
    
    func testBaseCurrency() {
        let ticker1 = Ticker(id: "BTC-PLN")
        XCTAssertEqual("BTC", ticker1?.baseCurrency)
        
        let ticker2 = Ticker(id: "btC-PlN")
        XCTAssertEqual("BTC", ticker2?.baseCurrency)
        
        let ticker3 = Ticker(id: "BTCPLN")
        XCTAssertNil(ticker3?.baseCurrency)
    }
    
    func testCounterCurrency() {
        let ticker1 = Ticker(id: "BTC-PLN")
        XCTAssertEqual("PLN", ticker1?.counterCurrency)
        
        let ticker2 = Ticker(id: "btC-PlN")
        XCTAssertEqual("PLN", ticker2?.counterCurrency)
        
        let ticker3 = Ticker(id: "BTCPLN")
        XCTAssertNil(ticker3?.baseCurrency)
    }
    
    func testIsAnyValueFilled() {
        var ticker = Ticker(id: "BTC-PLN")
        
        XCTAssert(ticker?.isAnyValueFilled == false)
        
        ticker?.highestBid = 1.1
        ticker?.lowestAsk = 2.2
        ticker?.rate = 3.3
        
        XCTAssert(ticker?.isAnyValueFilled == true)
        
        ticker?.previousRate = 4.4
        
        XCTAssert(ticker?.isAnyValueFilled == true)
    }
    
    func testSetUpValues() {
        var ticker = Ticker(id: "BTC-PLN")

        XCTAssertNil(ticker?.highestBid)
        XCTAssertNil(ticker?.lowestAsk)
        XCTAssertNil(ticker?.rate)
        XCTAssertNil(ticker?.previousRate)

        ticker?.setUpValues(using: TickerValuesAPIResponse(status: nil, ticker: TickerValuesAPIResponse.TickerAPIResponse(market: nil, time: nil, highestBid: "1.1", lowestAsk: "2.2", rate: "3.3", previousRate: "4.4")))

        XCTAssertEqual(1.1, ticker?.highestBid)
        XCTAssertEqual(2.2, ticker?.lowestAsk)
        XCTAssertEqual(3.3, ticker?.rate)
        XCTAssertEqual(4.4, ticker?.previousRate)
        
        XCTAssertTrue(true)
    }
    
    func testSetUpStatistics() {
        var ticker = Ticker(id: "BTC-PLN")

        XCTAssertNil(ticker?.highestRate)
        XCTAssertNil(ticker?.lowestRate)
        XCTAssertNil(ticker?.volume)
        XCTAssertNil(ticker?.average)
        
        ticker?.setUpStatistics(using: TickerStatisticsAPIResponse(status: nil, stats: TickerStatisticsAPIResponse.StatisticsAPIResponse(m: nil, h: "1.1", l: "2.2", v: "3.3", r24h: "4.4")))

        XCTAssertEqual(1.1, ticker?.highestRate)
        XCTAssertEqual(2.2, ticker?.lowestRate)
        XCTAssertEqual(3.3, ticker?.volume)
        XCTAssertEqual(4.4, ticker?.average)
        
        XCTAssertTrue(true)
    }
    
    static var allTests = [
        ("testBaseCurrency", testBaseCurrency),
        ("testCounterCurrency", testCounterCurrency),
        ("testIsAnyValueFilled", testIsAnyValueFilled),
        ("testSetUpValues", testSetUpValues)
    ]

}
