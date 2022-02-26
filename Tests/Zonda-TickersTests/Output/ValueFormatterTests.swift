import XCTest
@testable import Zonda_Tickers

final class ValueFormatterTests: XCTestCase {
    
    private var sut = ValueFormatter(locale: Locale.americanEnglish)
    
    // MARK: - Tests
    
    func test_string_fromNil() {
        XCTAssertEqual("-", sut.string(from: nil, fractionDigits: 2))
    }
    
    func test_string_fromNormalValue() {
        XCTAssertEqual("123,456.789", sut.string(from: 123456.789, fractionDigits: 3))
        XCTAssertEqual("123,456.79", sut.string(from: 123456.789, fractionDigits: 2))
    }
    
}

// MARK: - Stubs

final class CustomNumberFormatterStub: NumberFormatter {
    
    override func string(from number: NSNumber) -> String? { nil }
    
}
