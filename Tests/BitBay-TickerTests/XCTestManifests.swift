import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Bitbay_Ticker_Tests.allTests),
    ]
}
#endif
