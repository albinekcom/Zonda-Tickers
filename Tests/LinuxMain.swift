import XCTest
@testable import BitBay_TickerCoreTests

XCTMain([
    testCase(TickerStatisticsAPIResponseFactoryTests.allTests),
    testCase(TickerValuesAPIResponseFactoryTests.allTests),
    testCase(TickerTests.allTests),
    testCase(TickerValidatorTests.allTests),
    testCase(PrintArgumentsStoreTests.allTests),
    testCase(PrinterTests.allTests)
])
