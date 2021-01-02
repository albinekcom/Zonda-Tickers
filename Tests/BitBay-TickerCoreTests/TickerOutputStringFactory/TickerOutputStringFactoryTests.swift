import XCTest
@testable import BitBay_TickerCore

final class TickerOutputStringFactoryTests: XCTestCase {
    
    private let locale = Locale(identifier: "en_US")
    
    func testOutputStringForEmptyTickerForAllPrintArguments() throws {
        let ticker = Ticker(id: "BTC-PLN", highestBid: nil, lowestAsk: nil, rate: nil, previousRate: nil, highestRate: nil, lowestRate: nil, volume: nil, average: nil)
        let printArguments: [PrintArgument] = [.average, .highestBid, .highestRate, .lowestAsk, .lowestRate, .previousRate, .rate, .volume]
        
        let outputString = TickerOutputStringFactory(locale: locale).makePrintableString(ticker: ticker, printArguments: printArguments)
        
        XCTAssertEqual("Ticker BTC-PLN, average: - PLN, highest bid: - PLN, highest rate: - PLN, lowest ask: - PLN, highest bid: - PLN, previous rate: - PLN, rate: - PLN, volume: -", outputString)
    }
    
    func testOutputStringForFilledTickerForAllPrintArguments() throws {
        let ticker = Ticker(id: "BTC-PLN", highestBid: 11.11, lowestAsk: 22.22, rate: 33.33, previousRate: 44.44, highestRate: 55.55, lowestRate: 66.66, volume: 77.77, average: 88.88)
        let printArguments: [PrintArgument] = [.average, .highestBid, .highestRate, .lowestAsk, .lowestRate, .previousRate, .rate, .volume]
        
        let outputString = TickerOutputStringFactory(locale: locale).makePrintableString(ticker: ticker, printArguments: printArguments)
        
        XCTAssertEqual("Ticker BTC-PLN, average: 88.88 PLN, highest bid: 11.11 PLN, highest rate: 55.55 PLN, lowest ask: 22.22 PLN, highest bid: 66.66 PLN, previous rate: 44.44 PLN, rate: 33.33 PLN, volume: 77.77", outputString)
    }
    
    func testOutputStringForEmptyTickerForEmptyPrintArguments() throws {
        let ticker = Ticker(id: "BTC-PLN", highestBid: nil, lowestAsk: nil, rate: nil, previousRate: nil, highestRate: nil, lowestRate: nil, volume: nil, average: nil)
        let printArguments: [PrintArgument] = []
        
        let outputString = TickerOutputStringFactory(locale: locale).makePrintableString(ticker: ticker, printArguments: printArguments)
        
        XCTAssertEqual("Ticker BTC-PLN, ", outputString)

    }
    
    func testOutputStringForFilledTickerForEmptyPrintArguments() throws {
        let ticker = Ticker(id: "BTC-PLN", highestBid: 11.11, lowestAsk: 22.22, rate: 33.33, previousRate: 44.44, highestRate: 55.55, lowestRate: 66.66, volume: 77.77, average: 88.88)
        let printArguments: [PrintArgument] = []
        
        let outputString = TickerOutputStringFactory(locale: locale).makePrintableString(ticker: ticker, printArguments: printArguments)
        
        XCTAssertEqual("Ticker BTC-PLN, ", outputString)
    }
    
}
