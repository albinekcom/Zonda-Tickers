import XCTest
@testable import Zonda_Tickers

final class ValueFormatterTests: XCTestCase {
    
    private let sut = ValueFormatter(locale: Locale(identifier: "en-US"))
    
    // MARK: - Tests
    
    func test_stringFromNil() {
        XCTAssertEqual("-", sut.string(from: nil))
    }
    
    func test_stringFromNormalValue() {
        XCTAssertEqual("123,456.789", sut.string(from: 123456.789))
    }
    
    func test_stringFromNormalValue_WithSpecificFractionDigits() {
        XCTAssertEqual("123,456.79", sut.string(from: 123456.789, fractionDigits: 2))
    }
    
}
