import XCTest

import BitBay_Ticker_Core_Tests
import BitBay_Ticker_Main_Helpers_Tests

var tests = [XCTestCaseEntry]()
tests += BitBay_Ticker_Core_Tests.allTests()
tests += BitBay_Ticker_Main_Helpers_Tests.allTests()
XCTMain(tests)
