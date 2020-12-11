import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(BitBay_Ticker_Main_Helpers_Tests.allTests),
    ]
}
#endif
