import XCTest
@testable import BitBay_TickerCore

final class TickerPropertiesAPIErrorResponseTests: XCTestCase {
    
    func testIsFail() throws {
        XCTAssertTrue(TickerPropertiesAPIErrorResponse(status: "fail", errors: nil).isFail)
        XCTAssertTrue(TickerPropertiesAPIErrorResponse(status: "FAIL", errors: nil).isFail)
    }
    
    func testIsNotFail() throws {
        XCTAssertFalse(TickerPropertiesAPIErrorResponse(status: "Different Text", errors: nil).isFail)
        XCTAssertFalse(TickerPropertiesAPIErrorResponse(status: nil, errors: nil).isFail)
    }
    
}

