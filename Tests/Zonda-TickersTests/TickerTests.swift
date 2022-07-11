import XCTest
@testable import Zonda_Tickers

final class TickerTests: XCTestCase {
    
    func test_change() {
        XCTAssertEqual(
            6,
            Ticker.stub.change
        )
        XCTAssertNil(Ticker.emptyStub.change)
    }

    func test_volumeValue() {
        XCTAssertEqual(
            6844.376,
            Ticker.stub.volumeValue
        )
        XCTAssertNil(Ticker.emptyStub.volumeValue)
    }
    
}
