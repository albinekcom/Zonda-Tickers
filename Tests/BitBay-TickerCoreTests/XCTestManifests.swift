import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(BitBay_Ticker_Core_Tests.allTests),
    ]
}
#endif
