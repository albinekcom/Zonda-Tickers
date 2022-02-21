import XCTest
@testable import Zonda_Tickers

final class ValueFormatterTests: XCTestCase {
    
    private var sut = ValueFormatter(locale: Locale(identifier: "en-US"))
    
    // MARK: - Tests
    
    func test_string_fromNil() {
        XCTAssertEqual("-", sut.string(from: nil))
    }
    
    func test_string_fromNormalValue() {
        XCTAssertEqual("123,456.789", sut.string(from: 123456.789))
    }
    
    func test_string_fromNormalValue_withSpecificFractionDigits() {
        XCTAssertEqual("123,456.79", sut.string(from: 123456.789, fractionDigits: 2))
    }
    
    func test_string_fromNormalValue_withCustomNumberFormatter() {
        sut = ValueFormatter(locale: Locale(identifier: "en-US"), numberFormatterType: CustomNumberFormatterStub.self)
        
        XCTAssertEqual("-", sut.string(from: 123456.789))
    }
    
}

// MARK: - Stubs

final class CustomNumberFormatterStub: NumberFormatter {
    
    override func string(from number: NSNumber) -> String? { nil }
    
}
