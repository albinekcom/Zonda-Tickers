import XCTest
@testable import BitBay_TickerCore

final class ArgumentsTests: XCTestCase {
    
    func testProperTickerIdentifier() {
        let input = ["BitBay-Ticker", "BTC-PLN", "--rate"]
        
        let arguments = Arguments(stringArguments: input)
        
        XCTAssertEqual("BTC-PLN", arguments.tickerIdentifier)
    }
    
    func testWrongTickerIdentifier() {
        let input = ["BitBay-Ticker"]
        
        let arguments = Arguments(stringArguments: input)
        
        XCTAssertNil(arguments.tickerIdentifier)
    }
    
    func testParsingStringArgumentToHighestBidPrintArgument() {
        let input = ["BitBay-Ticker", "BTC-PLN", "--highestBid"]
        
        let arguments = Arguments(stringArguments: input)
        
        XCTAssertEqual([.highestBid], arguments.printArguments)
    }
    
    func testParsingStringArgumentToLowestAskPrintArgument() {
        let input = ["BitBay-Ticker", "BTC-PLN", "--lowestAsk"]
        
        let arguments = Arguments(stringArguments: input)
        
        XCTAssertEqual([.lowestAsk], arguments.printArguments)
    }
    
    func testParsingStringArgumentToRatePrintArgument() {
        let input = ["BitBay-Ticker", "BTC-PLN", "--rate"]
        
        let arguments = Arguments(stringArguments: input)
        
        XCTAssertEqual([.rate], arguments.printArguments)
    }
    
    func testParsingStringArgumentToPreviousRatePrintArgument() {
        let input = ["BitBay-Ticker", "BTC-PLN", "--previousRate"]
        
        let arguments = Arguments(stringArguments: input)
        
        XCTAssertEqual([.previousRate], arguments.printArguments)
    }
    
    func testParsingStringArgumentToHighestRatePrintArgument() {
        let input = ["BitBay-Ticker", "BTC-PLN", "--highestRate"]
        
        let arguments = Arguments(stringArguments: input)
        
        XCTAssertEqual([.highestRate], arguments.printArguments)
    }
    
    func testParsingStringArgumentToLowestRatePrintArgument() {
        let input = ["BitBay-Ticker", "BTC-PLN", "--lowestRate"]
        
        let arguments = Arguments(stringArguments: input)
        
        XCTAssertEqual([.lowestRate], arguments.printArguments)
    }
    
    func testParsingStringArgumentToVolumePrintArgument() {
        let input = ["BitBay-Ticker", "BTC-PLN", "--volume"]
        
        let arguments = Arguments(stringArguments: input)
        
        XCTAssertEqual([.volume], arguments.printArguments)
    }
    
    func testParsingStringArgumentToAveragePrintArgument() {
        let input = ["BitBay-Ticker", "BTC-PLN", "--average"]
        
        let arguments = Arguments(stringArguments: input)
        
        XCTAssertEqual([.average], arguments.printArguments)
    }
    
    func testParsingWrongStringArgument() {
        let input = ["BitBay-Ticker", "BTC-PLN", "-rate"]
        
        let arguments = Arguments(stringArguments: input)
        
        XCTAssertEqual([], arguments.printArguments)
    }
    
    func testParsingTwoStringArgumentsToTwoPrintArguments() {
        let input = ["BitBay-Ticker", "BTC-PLN", "--average", "--rate"]
        
        let arguments = Arguments(stringArguments: input)
        
        XCTAssertEqual([.average, .rate], arguments.printArguments)
    }
    
    func testMappingEmptyStringArgumentsToAllPrintArguments() {
        let input = ["BitBay-Ticker"]
        
        let arguments = Arguments(stringArguments: input)
        
        XCTAssertEqual([.highestBid, .lowestAsk, .rate, .previousRate, .highestRate, .lowestRate, .volume, .average], arguments.printArguments)
    }
    
}
