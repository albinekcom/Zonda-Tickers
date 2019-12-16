import XCTest
@testable import BitBay_TickerCore

final class TickerValidatorTests: XCTestCase {
    
    func testIsIdValid() {
        XCTAssertTrue(TickerValidator.isIdValid("BTC-PLN"))
        XCTAssertTrue(TickerValidator.isIdValid("Btc-PlN"))
        XCTAssertTrue(TickerValidator.isIdValid("btc-pln"))
        
        XCTAssertFalse(TickerValidator.isIdValid("BTC/PLN"))
        XCTAssertFalse(TickerValidator.isIdValid("btc--pln"))
        XCTAssertFalse(TickerValidator.isIdValid("btc-pln-pln"))
        XCTAssertFalse(TickerValidator.isIdValid("btc-"))
        XCTAssertFalse(TickerValidator.isIdValid("-pln"))
        XCTAssertFalse(TickerValidator.isIdValid("-"))
    }
    
    static var allTests = [
        ("testIsIdValid", testIsIdValid)
    ]
    
}
