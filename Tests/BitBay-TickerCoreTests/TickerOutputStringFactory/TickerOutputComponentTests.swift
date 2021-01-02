import XCTest
@testable import BitBay_TickerCore

final class TickerOutputComponentTests: XCTestCase {
    
    private var numberFormatter: NumberFormatter!
    
    // MARK: - Setting
    
    override func setUp() {
        self.numberFormatter = NumberFormatter()
        self.numberFormatter.locale = Locale(identifier: "en_US")
        self.numberFormatter.numberStyle = .decimal
        self.numberFormatter.minimumFractionDigits = 2
    }
    
    // MARK: - Counter Currency Added At The End
    
    func testIsCounterCurrencyAddedAtTheEnd() throws {
        let component = TickerOutputComponent(title: "TEST_TITLE", value: 11.11, isCounterCurrencyAddedAtTheEnd: true, counterCurrency: "BTC", numberFormatter: numberFormatter)
        
        XCTAssertEqual("TEST_TITLE: 11.11 BTC", component.description)
    }
    
    func testIsNotCounterCurrencyAddedAtTheEnd() throws {
        let component = TickerOutputComponent(title: "TEST_TITLE", value: 11.11, isCounterCurrencyAddedAtTheEnd: false, counterCurrency: "BTC", numberFormatter: numberFormatter)
        
        XCTAssertEqual("TEST_TITLE: 11.11", component.description)
    }
    
    func testIsCounterCurrencyAddedAtTheEndWithoutCounterCurrency() throws {
        let component = TickerOutputComponent(title: "TEST_TITLE", value: 11.11, isCounterCurrencyAddedAtTheEnd: true, counterCurrency: nil, numberFormatter: numberFormatter)
        
        XCTAssertEqual("TEST_TITLE: 11.11", component.description)
    }
    
    func testIsNotCounterCurrencyAddedAtTheEndWithoutCounterCurrency() throws {
        let component = TickerOutputComponent(title: "TEST_TITLE", value: 11.11, isCounterCurrencyAddedAtTheEnd: false, counterCurrency: nil, numberFormatter: numberFormatter)
        
        XCTAssertEqual("TEST_TITLE: 11.11", component.description)
    }
    
    // MARK: - Value String
    
    func testValueStringWithFormattedValue() throws {
        let component = TickerOutputComponent(title: "TEST_TITLE", value: 1111.11, isCounterCurrencyAddedAtTheEnd: true, counterCurrency: "BTC", numberFormatter: numberFormatter)
        
        XCTAssertEqual("TEST_TITLE: 1,111.11 BTC", component.description)
    }
    
    func testValueStringWithNotFormattedValue() throws {
        let component = TickerOutputComponent(title: "TEST_TITLE", value: nil, isCounterCurrencyAddedAtTheEnd: true, counterCurrency: "BTC", numberFormatter: numberFormatter)
        
        XCTAssertEqual("TEST_TITLE: - BTC", component.description)
    }
    
    func testValueStringWithoutValue() throws {
        let component = TickerOutputComponent(title: "TEST_TITLE", value: 1111.11, isCounterCurrencyAddedAtTheEnd: true, counterCurrency: "BTC", numberFormatter: MockNumberFormatterWithReturningNilString())
        
        XCTAssertEqual("TEST_TITLE: 1111.11 BTC", component.description)
    }
}

// MARK: - Helpers

final class MockNumberFormatterWithReturningNilString: NumberFormatter {
    
    override func string(from number: NSNumber) -> String? { nil }
    
}
