import XCTest
@testable import BitBay_TickerCore

final class TickerNameValidatorTests: XCTestCase {
    
    func testIsValid() {
        XCTAssertTrue(TickerNameValidator.isValid(name: "BTC-PLN"))
        XCTAssertTrue(TickerNameValidator.isValid(name: "Btc-PlN"))
        XCTAssertTrue(TickerNameValidator.isValid(name: "btc-pln"))
        
        XCTAssertFalse(TickerNameValidator.isValid(name: "BTC/PLN"))
        XCTAssertFalse(TickerNameValidator.isValid(name: "btc--pln"))
        XCTAssertFalse(TickerNameValidator.isValid(name: "btc-pln-pln"))
        XCTAssertFalse(TickerNameValidator.isValid(name: "btc-"))
        XCTAssertFalse(TickerNameValidator.isValid(name: "-pln"))
        XCTAssertFalse(TickerNameValidator.isValid(name: "-"))
    }
    
    static var allTests = [
        ("testIsValid", testIsValid)
    ]
    
}
