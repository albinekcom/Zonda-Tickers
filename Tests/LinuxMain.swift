import XCTest
@testable import BitBay_TickerCoreTests

XCTMain([
    testCase(TickerTests.allTests),
    testCase(TickerNameValidatorTests.allTests)
])
