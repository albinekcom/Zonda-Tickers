import XCTest
@testable import BitBay_TickerCore

final class TickerValuesAPIResponseFactoryTests: XCTestCase {
    
    func testMakeTickerValuesAPIResponseWithCorrectTickerAPIName() {
        let tickerValuesAPIResponse = TickerValuesAPIResponseFactory.makeTickerValuesAPIResponse(for: "BTC-PLN")
        
        XCTAssertNotNil(tickerValuesAPIResponse?.ticker?.highestBid)
        XCTAssertNotNil(tickerValuesAPIResponse?.ticker?.lowestAsk)
        XCTAssertNotNil(tickerValuesAPIResponse?.ticker?.rate)
        XCTAssertNotNil(tickerValuesAPIResponse?.ticker?.previousRate)
    }
    
    func testMakeTickerValuesAPIResponseWithIncorrectTickerAPIName() {
        let tickerValuesAPIResponse = TickerValuesAPIResponseFactory.makeTickerValuesAPIResponse(for: "WRONG_TICKER_API_NAME")
        
        XCTAssertNil(tickerValuesAPIResponse?.ticker?.highestBid)
        XCTAssertNil(tickerValuesAPIResponse?.ticker?.lowestAsk)
        XCTAssertNil(tickerValuesAPIResponse?.ticker?.rate)
        XCTAssertNil(tickerValuesAPIResponse?.ticker?.previousRate)
    }
    
    static var allTests = [
        ("testMakeTickerValuesAPIResponseWithCorrectTickerAPIName", testMakeTickerValuesAPIResponseWithCorrectTickerAPIName),
        ("testMakeTickerValuesAPIResponseWithIncorrectTickerAPIName", testMakeTickerValuesAPIResponseWithIncorrectTickerAPIName)
    ]
    
}
