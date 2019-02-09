import XCTest
@testable import BitBay_TickerCore

final class TickerValuesAPIResponseFactoryTests: XCTestCase {
    
    func testMakeTickerValuesAPIResponseWithCorrectTickerAPIName() {
        let tickerValuesAPIResponse = TickerValuesAPIResponseFactory.makeTickerValuesAPIResponse(for: "BTCPLN")
        
        XCTAssertNotNil(tickerValuesAPIResponse?.max)
        XCTAssertNotNil(tickerValuesAPIResponse?.min)
        XCTAssertNotNil(tickerValuesAPIResponse?.last)
        XCTAssertNotNil(tickerValuesAPIResponse?.bid)
        XCTAssertNotNil(tickerValuesAPIResponse?.ask)
        XCTAssertNotNil(tickerValuesAPIResponse?.vwap)
        XCTAssertNotNil(tickerValuesAPIResponse?.average)
        XCTAssertNotNil(tickerValuesAPIResponse?.volume)
    }
    
    func testMakeTickerValuesAPIResponseWithIncorrectTickerAPIName() {
        let tickerValuesAPIResponse = TickerValuesAPIResponseFactory.makeTickerValuesAPIResponse(for: "WRONG_TICKER_API_NAME")
        
        XCTAssertNil(tickerValuesAPIResponse?.max)
        XCTAssertNil(tickerValuesAPIResponse?.min)
        XCTAssertNil(tickerValuesAPIResponse?.last)
        XCTAssertNil(tickerValuesAPIResponse?.bid)
        XCTAssertNil(tickerValuesAPIResponse?.ask)
        XCTAssertNil(tickerValuesAPIResponse?.vwap)
        XCTAssertNil(tickerValuesAPIResponse?.average)
        XCTAssertNil(tickerValuesAPIResponse?.volume)
    }
    
    static var allTests = [
        ("testMakeTickerValuesAPIResponseWithCorrectTickerAPIName", testMakeTickerValuesAPIResponseWithCorrectTickerAPIName),
        ("testMakeTickerValuesAPIResponseWithIncorrectTickerAPIName", testMakeTickerValuesAPIResponseWithIncorrectTickerAPIName)
    ]
    
}
