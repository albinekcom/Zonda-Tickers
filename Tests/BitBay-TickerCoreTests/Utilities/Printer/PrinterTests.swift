import XCTest
@testable import BitBay_TickerCore

final class PrinterTests: XCTestCase {
    
    func testMakePrettyDescription() {
        var ticker = Ticker(id: "BTC-PLN")!
        
        ticker.setUpValues(using: TickerValuesAPIResponse(status: nil, ticker: TickerValuesAPIResponse.TickerAPIResponse(market: nil, time: nil, highestBid: "1.1", lowestAsk: "2.2", rate: "3.3", previousRate: nil)))
        ticker.setUpStatistics(using: TickerStatisticsAPIResponse(status: nil, stats: TickerStatisticsAPIResponse.StatisticsAPIResponse(m: nil, h: "4.4", l: nil, v: "5.5", r24h: nil)))
        
        XCTAssertEqual("Ticker BTC-PLN", Printer.makePrettyDescription(for: ticker, printArguments: []))
        
        XCTAssertEqual("Ticker BTC-PLN, highest bid: 1.1 PLN", Printer.makePrettyDescription(for: ticker, printArguments: [.highestBid]))
        XCTAssertEqual("Ticker BTC-PLN, lowest ask: 2.2 PLN", Printer.makePrettyDescription(for: ticker, printArguments: [.lowestAsk]))
        XCTAssertEqual("Ticker BTC-PLN, rate: 3.3 PLN", Printer.makePrettyDescription(for: ticker, printArguments: [.rate]))
        XCTAssertEqual("Ticker BTC-PLN, highest rate: 4.4 PLN", Printer.makePrettyDescription(for: ticker, printArguments: [.highestRate]))
        XCTAssertEqual("Ticker BTC-PLN, volume: 5.5", Printer.makePrettyDescription(for: ticker, printArguments: [.volume]))
        
        XCTAssertEqual("Ticker BTC-PLN, highest bid: 1.1 PLN, lowest ask: 2.2 PLN", Printer.makePrettyDescription(for: ticker, printArguments: [.highestBid, .lowestAsk]))
        
        XCTAssertEqual("Ticker BTC-PLN, average: - PLN", Printer.makePrettyDescription(for: ticker, printArguments: [.average]))
    }
    
    static var allTests = [
        ("testMakePrettyDescription", testMakePrettyDescription)
    ]
    
}
