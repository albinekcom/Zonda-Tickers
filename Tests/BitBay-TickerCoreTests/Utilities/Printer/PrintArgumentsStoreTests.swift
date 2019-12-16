import XCTest
@testable import BitBay_TickerCore

final class PrintArgumentsStoreTests: XCTestCase {
    
    func testPrintArguments() {
        let store1 = PrintArgumentsStore(userPrintArguments: [])
        XCTAssertEqual([.highestBid, .lowestAsk, .rate, .previousRate, .highestRate, .lowestRate, .volume, .average], store1.printArguments)
        
        let store2 = PrintArgumentsStore(userPrintArguments: ["highestBid"])
        XCTAssertEqual([], store2.printArguments)
        
        let store3 = PrintArgumentsStore(userPrintArguments: ["--highestBid"])
        XCTAssertEqual([.highestBid], store3.printArguments)
        
        let store4 = PrintArgumentsStore(userPrintArguments: ["--highestBid", "--lowestAsk"])
        XCTAssertEqual([.highestBid, .lowestAsk], store4.printArguments)
        
        let store5 = PrintArgumentsStore(userPrintArguments: ["--highestBid", "--lowestAsk", "--rate", "--previousRate", "--highestRate", "--lowestRate", "--volume", "--average"])
        XCTAssertEqual([.highestBid, .lowestAsk, .rate, .previousRate, .highestRate, .lowestRate, .volume, .average], store5.printArguments)
    }
    
    func testShouldFetchTickerValues() {
        let store1 = PrintArgumentsStore(userPrintArguments: [])
        XCTAssertTrue(store1.shouldFetchTickerValues)
        
        let store2 = PrintArgumentsStore(userPrintArguments: ["highestBid"])
        XCTAssertFalse(store2.shouldFetchTickerValues)
        
        let store3 = PrintArgumentsStore(userPrintArguments: ["--highestBid"])
        XCTAssertTrue(store3.shouldFetchTickerValues)
        
        let store4 = PrintArgumentsStore(userPrintArguments: ["--lowestAsk"])
        XCTAssertTrue(store4.shouldFetchTickerValues)
        
        let store5 = PrintArgumentsStore(userPrintArguments: ["--rate"])
        XCTAssertTrue(store5.shouldFetchTickerValues)
        
        let store6 = PrintArgumentsStore(userPrintArguments: ["--previousRate"])
        XCTAssertTrue(store6.shouldFetchTickerValues)
        
        let store7 = PrintArgumentsStore(userPrintArguments: ["--highestBid", "--previousRate", "--volume"])
        XCTAssertTrue(store7.shouldFetchTickerValues)
        
        let store8 = PrintArgumentsStore(userPrintArguments: ["--volume"])
        XCTAssertFalse(store8.shouldFetchTickerValues)
    }
    
    func testShouldFetchTickerStatistics() {
        let store1 = PrintArgumentsStore(userPrintArguments: [])
        XCTAssertTrue(store1.shouldFetchTickerStatistics)
        
        let store2 = PrintArgumentsStore(userPrintArguments: ["highestRate"])
        XCTAssertFalse(store2.shouldFetchTickerStatistics)
        
        let store3 = PrintArgumentsStore(userPrintArguments: ["--highestRate"])
        XCTAssertTrue(store3.shouldFetchTickerStatistics)
        
        let store4 = PrintArgumentsStore(userPrintArguments: ["--lowestRate"])
        XCTAssertTrue(store4.shouldFetchTickerStatistics)
        
        let store5 = PrintArgumentsStore(userPrintArguments: ["--volume"])
        XCTAssertTrue(store5.shouldFetchTickerStatistics)
        
        let store6 = PrintArgumentsStore(userPrintArguments: ["--average"])
        XCTAssertTrue(store6.shouldFetchTickerStatistics)
        
        let store7 = PrintArgumentsStore(userPrintArguments: ["--highestRate", "--lowestRate", "--rate"])
        XCTAssertTrue(store7.shouldFetchTickerStatistics)
        
        let store8 = PrintArgumentsStore(userPrintArguments: ["--rate"])
        XCTAssertFalse(store8.shouldFetchTickerStatistics)
    }
    
    static var allTests = [
        ("testPrintArguments", testPrintArguments),
        ("testShouldFetchTickerValues", testShouldFetchTickerValues),
        ("testShouldFetchTickerStatistics", testShouldFetchTickerStatistics)
    ]
    
}
