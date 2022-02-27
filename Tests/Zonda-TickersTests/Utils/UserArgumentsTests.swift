import XCTest
@testable import Zonda_Tickers

final class UserArgumentsTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_tickerIds_forNormalUsedUserArguments() {
        XCTAssertEqual(["btc-pln", "eth-pln"], usedUserArguments.tickerIds)
    }
    
    func test_printArguments_forNormalUsedUserArguments() {
        XCTAssertEqual([.rate, .average, .highestBid], usedUserArguments.printArguments)
    }
    
    func test_shouldLoadValues_forNormalUsedUserArguments() {
        XCTAssertTrue(usedUserArguments.shouldLoadValues)
    }
    
    func test_shouldLoadStatistics_forNormalUsedUserArguments() {
        XCTAssertTrue(usedUserArguments.shouldLoadStatistics)
    }
    
    func test_shouldLoadValuesAndShouldLoadStatistics_forPrintArguments() {
        let ua1 = UserArguments(argumentStrings: ["--highestBid"])
        XCTAssertTrue(ua1.shouldLoadValues)
        XCTAssertFalse(ua1.shouldLoadStatistics)
        
        let ua2 = UserArguments(argumentStrings: ["--lowestAsk"])
        XCTAssertTrue(ua2.shouldLoadValues)
        XCTAssertFalse(ua2.shouldLoadStatistics)
        
        let ua3 = UserArguments(argumentStrings: ["--rate"])
        XCTAssertTrue(ua3.shouldLoadValues)
        XCTAssertFalse(ua3.shouldLoadStatistics)
        
        let ua4 = UserArguments(argumentStrings: ["--previousRate"])
        XCTAssertTrue(ua4.shouldLoadValues)
        XCTAssertFalse(ua4.shouldLoadStatistics)
        
        let ua5 = UserArguments(argumentStrings: ["--highestRate"])
        XCTAssertFalse(ua5.shouldLoadValues)
        XCTAssertTrue(ua5.shouldLoadStatistics)
        
        let ua6 = UserArguments(argumentStrings: ["--lowestRate"])
        XCTAssertFalse(ua6.shouldLoadValues)
        XCTAssertTrue(ua6.shouldLoadStatistics)
        
        let ua7 = UserArguments(argumentStrings: ["--volume"])
        XCTAssertFalse(ua7.shouldLoadValues)
        XCTAssertTrue(ua7.shouldLoadStatistics)
        
        let ua8 = UserArguments(argumentStrings: ["--volumeValue"])
        XCTAssertTrue(ua8.shouldLoadValues)
        XCTAssertTrue(ua8.shouldLoadStatistics)
        
        let ua9 = UserArguments(argumentStrings: ["--average"])
        XCTAssertFalse(ua9.shouldLoadValues)
        XCTAssertTrue(ua9.shouldLoadStatistics)
        
        let ua10 = UserArguments(argumentStrings: ["--change"])
        XCTAssertTrue(ua10.shouldLoadValues)
        XCTAssertTrue(ua10.shouldLoadStatistics)
    }
    
    // MARK: - Helpers
    
    private let usedUserArguments = UserArguments(argumentStrings: ["btc-pln", "wrong", "eth-pln", "--rate", "--average", "--highestBid"])
    
}
