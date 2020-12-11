import XCTest
@testable import BitBay_TickerCore

final class String_DoubleValueTests: XCTestCase {

    func testProperMappingToDoubleValue() throws {
        XCTAssertEqual(1, "1".doubleValue)
        XCTAssertEqual(11.11, "11.11".doubleValue)
    }
    
    func testWrongMappingToDoubleValue() throws {
        XCTAssertNil("A".doubleValue)
    }
    
}
