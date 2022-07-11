import XCTest
@testable import Zonda_Tickers

final class ValueFormatterTests: XCTestCase {
    
    func test_string() {
        XCTAssertEqual(
            "-",
            ValueFormatter(locale: .americanEnglish).string(
                from: nil,
                fractionDigitsCount: nil
            )
        )
        
        XCTAssertEqual(
            "12.345",
            ValueFormatter(locale: .americanEnglish).string(
                from: 12.345,
                fractionDigitsCount: nil
            )
        )
        
        XCTAssertEqual(
            "12.34",
            ValueFormatter(locale: .americanEnglish).string(
                from: 12.34,
                fractionDigitsCount: 2
            )
        )
        
        XCTAssertEqual(
            "+1,234.00%",
            ValueFormatter(locale: .americanEnglish).string(
                from: 12.34,
                fractionDigitsCount: 2,
                numberStyle: .percent,
                positivePrefix: "+"
            )
        )
        
        XCTAssertEqual(
            "-",
            ValueFormatter(locale: .americanEnglish, numberFormatter: NumberFormatterStringNilStub()).string(
                from: 12.345,
                fractionDigitsCount: nil
            )
        )
    }
    
}

private final class NumberFormatterStringNilStub: NumberFormatter {
    
    override func string(from number: NSNumber) -> String? { nil }
    
}
