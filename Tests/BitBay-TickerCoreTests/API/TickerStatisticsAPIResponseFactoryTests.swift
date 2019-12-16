import XCTest
@testable import BitBay_TickerCore

final class TickerStatisticsAPIResponseFactoryTests: XCTestCase {
    
    func testMakeTickerStatisticsAPIResponseWithCorrectTickerAPIName() {
        let tickerStatisticsAPIResponse = TickerStatisticsAPIResponseFactory.makeTickerStatisticsAPIResponse(for: "BTC-PLN")
        
        XCTAssertNotNil(tickerStatisticsAPIResponse?.stats?.h)
        XCTAssertNotNil(tickerStatisticsAPIResponse?.stats?.l)
        XCTAssertNotNil(tickerStatisticsAPIResponse?.stats?.v)
        XCTAssertNotNil(tickerStatisticsAPIResponse?.stats?.r24h)
    }
    
    func testMakeTickerStatisticsAPIResponseWithIncorrectTickerAPIName() {
        let tickerStatisticsAPIResponse = TickerStatisticsAPIResponseFactory.makeTickerStatisticsAPIResponse(for: "WRONG_TICKER_API_NAME")
        
        XCTAssertNil(tickerStatisticsAPIResponse?.stats?.h)
        XCTAssertNil(tickerStatisticsAPIResponse?.stats?.l)
        XCTAssertNil(tickerStatisticsAPIResponse?.stats?.v)
        XCTAssertNil(tickerStatisticsAPIResponse?.stats?.r24h)
    }
    
    static var allTests = [
        ("testMakeTickerStatisticsAPIResponseWithCorrectTickerAPIName", testMakeTickerStatisticsAPIResponseWithCorrectTickerAPIName),
        ("testMakeTickerStatisticsAPIResponseWithIncorrectTickerAPIName", testMakeTickerStatisticsAPIResponseWithIncorrectTickerAPIName)
    ]
    
}
