import XCTest
@testable import BitBay_TickerCore

final class TickerNameValidatorTests: XCTestCase {
    
    func testIsValid() {
        XCTAssertTrue(TickerNameValidator.isValid(name: "BTCPLN"))
        XCTAssertTrue(TickerNameValidator.isValid(name: "BTCUSD"))
        XCTAssertTrue(TickerNameValidator.isValid(name: "BTCEUR"))
        
        XCTAssertTrue(TickerNameValidator.isValid(name: "LTCPLN"))
        XCTAssertTrue(TickerNameValidator.isValid(name: "LTCUSD"))
        XCTAssertTrue(TickerNameValidator.isValid(name: "LTCEUR"))
        XCTAssertTrue(TickerNameValidator.isValid(name: "LTCBTC"))
        
        XCTAssertTrue(TickerNameValidator.isValid(name: "ETHPLN"))
        XCTAssertTrue(TickerNameValidator.isValid(name: "ETHUSD"))
        XCTAssertTrue(TickerNameValidator.isValid(name: "ETHEUR"))
        XCTAssertTrue(TickerNameValidator.isValid(name: "ETHBTC"))
        
        XCTAssertTrue(TickerNameValidator.isValid(name: "LSKPLN"))
        XCTAssertTrue(TickerNameValidator.isValid(name: "LSKUSD"))
        XCTAssertTrue(TickerNameValidator.isValid(name: "LSKEUR"))
        XCTAssertTrue(TickerNameValidator.isValid(name: "LSKBTC"))
        
        XCTAssertTrue(TickerNameValidator.isValid(name: "BCCPLN"))
        XCTAssertTrue(TickerNameValidator.isValid(name: "BCCUSD"))
        XCTAssertTrue(TickerNameValidator.isValid(name: "BCCEUR"))
        XCTAssertTrue(TickerNameValidator.isValid(name: "BCCBTC"))
        
        XCTAssertTrue(TickerNameValidator.isValid(name: "DASHPLN"))
        XCTAssertTrue(TickerNameValidator.isValid(name: "DASHUSD"))
        XCTAssertTrue(TickerNameValidator.isValid(name: "DASHEUR"))
        XCTAssertTrue(TickerNameValidator.isValid(name: "DASHBTC"))
        
        XCTAssertTrue(TickerNameValidator.isValid(name: "GAMEPLN"))
        XCTAssertTrue(TickerNameValidator.isValid(name: "GAMEUSD"))
        XCTAssertTrue(TickerNameValidator.isValid(name: "GAMEEUR"))
        XCTAssertTrue(TickerNameValidator.isValid(name: "GAMEBTC"))
        
        XCTAssertTrue(TickerNameValidator.isValid(name: "BTGPLN"))
        XCTAssertTrue(TickerNameValidator.isValid(name: "BTGUSD"))
        XCTAssertTrue(TickerNameValidator.isValid(name: "BTGEUR"))
        XCTAssertTrue(TickerNameValidator.isValid(name: "BTGBTC"))
        
        XCTAssertTrue(TickerNameValidator.isValid(name: "KZCBTC"))
        
        XCTAssertTrue(TickerNameValidator.isValid(name: "XRPPLN"))
        XCTAssertTrue(TickerNameValidator.isValid(name: "XRPEUR"))
        XCTAssertTrue(TickerNameValidator.isValid(name: "XRPUSD"))
        XCTAssertTrue(TickerNameValidator.isValid(name: "XRPBTC"))
        
        XCTAssertTrue(TickerNameValidator.isValid(name: "XINBTC"))
        
        XCTAssertTrue(TickerNameValidator.isValid(name: "btcpln"))
        XCTAssertTrue(TickerNameValidator.isValid(name: "BTCplN"))
        
        XCTAssertFalse(TickerNameValidator.isValid(name: "BTCPLNN"))
        XCTAssertFalse(TickerNameValidator.isValid(name: ""))
        XCTAssertFalse(TickerNameValidator.isValid(name: "BTCPL"))
        XCTAssertFalse(TickerNameValidator.isValid(name: "LSKETH"))
    }
    
    static var allTests = [
        ("testIsValid", testIsValid)
    ]
    
}
