import XCTest
@testable import Zonda_Tickers

final class UserArgumentsTests: XCTestCase {
    
    func test_tickerIds() {
        XCTAssertEqual(
            ["btc-pln", "eth-pln"],
            UserArguments.stub.tickerIds
        )
    }
    
    func test_printArguments() {
        XCTAssertEqual(
            [.rate, .average, .highestBid],
            UserArguments.stub.printArguments
        )
    }
    
}
