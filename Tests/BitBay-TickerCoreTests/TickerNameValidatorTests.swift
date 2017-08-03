import XCTest
@testable import BitBay_TickerCore

final class TickerNameValidatorTests: XCTestCase {
    
    private var validator: TickerNameValidator!
    
    override func setUp() {
        super.setUp()
        
        validator = TickerNameValidator()
    }
    
    func testIsValid() {
        XCTAssertTrue(validator.isValid(name: "BTCPLN"))
        XCTAssertTrue(validator.isValid(name: "BTCUSD"))
        XCTAssertTrue(validator.isValid(name: "BTCEUR"))
        
        XCTAssertTrue(validator.isValid(name: "LTCPLN"))
        XCTAssertTrue(validator.isValid(name: "LTCUSD"))
        XCTAssertTrue(validator.isValid(name: "LTCEUR"))
        XCTAssertTrue(validator.isValid(name: "LTCBTC"))
        
        XCTAssertTrue(validator.isValid(name: "ETHPLN"))
        XCTAssertTrue(validator.isValid(name: "ETHUSD"))
        XCTAssertTrue(validator.isValid(name: "ETHEUR"))
        XCTAssertTrue(validator.isValid(name: "ETHBTC"))
        
        XCTAssertTrue(validator.isValid(name: "LSKPLN"))
        XCTAssertTrue(validator.isValid(name: "LSKUSD"))
        XCTAssertTrue(validator.isValid(name: "LSKEUR"))
        XCTAssertTrue(validator.isValid(name: "LSKBTC"))
        
        XCTAssertTrue(validator.isValid(name: "BCCPLN"))
        XCTAssertTrue(validator.isValid(name: "BCCUSD"))
        XCTAssertTrue(validator.isValid(name: "BCCEUR"))
        XCTAssertTrue(validator.isValid(name: "BCCBTC"))
        
        XCTAssertTrue(validator.isValid(name: "btcpln"))
        XCTAssertTrue(validator.isValid(name: "BTCplN"))
        
        XCTAssertFalse(validator.isValid(name: "BTCPLNN"))
        XCTAssertFalse(validator.isValid(name: ""))
        XCTAssertFalse(validator.isValid(name: "BTCPL"))
        XCTAssertFalse(validator.isValid(name: "LSKETH"))
    }
    
    static var allTests = [
        ("testIsValid", testIsValid)
    ]
    
}
