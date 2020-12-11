import XCTest
@testable import BitBay_TickerCore

final class TickerIdentifierValidatorTests: XCTestCase {
    
    func testProperIdentifier() throws {
        XCTAssertTrue(TickerIdentifierValidator().isValid(tickerIdentifier: "BTC-PLN"))
        XCTAssertTrue(TickerIdentifierValidator().isValid(tickerIdentifier: "btC-PlN"))
        XCTAssertTrue(TickerIdentifierValidator().isValid(tickerIdentifier: "btC-DASH"))
        XCTAssertTrue(TickerIdentifierValidator().isValid(tickerIdentifier: "USD-DASH"))
    }
    
    func testWrongIdentifier() throws {
        XCTAssertFalse(TickerIdentifierValidator().isValid(tickerIdentifier: "PLN"))
        XCTAssertFalse(TickerIdentifierValidator().isValid(tickerIdentifier: "PLN-"))
        XCTAssertFalse(TickerIdentifierValidator().isValid(tickerIdentifier: "-PLN"))
        XCTAssertFalse(TickerIdentifierValidator().isValid(tickerIdentifier: "BTC/PLN"))
        XCTAssertFalse(TickerIdentifierValidator().isValid(tickerIdentifier: "BTC--PLN"))
        XCTAssertFalse(TickerIdentifierValidator().isValid(tickerIdentifier: "BTCPLN"))
    }
    
}
