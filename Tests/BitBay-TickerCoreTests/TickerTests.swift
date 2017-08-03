import XCTest
@testable import BitBay_TickerCore

final class TickerTests: XCTestCase {
    
    private var ticker: Ticker!
    
    override func setUp() {
        super.setUp()
        
        let name = "BTCPLN"
        let jsonString = "{\"max\":11273,\"min\":10175.99,\"last\":11273,\"bid\":11250,\"ask\":11273,\"vwap\":11016.08,\"average\":11273,\"volume\":1050.98805379}"
        let jsonDictionary = try! JSONSerialization.jsonObject(with: jsonString.data(using: .utf8)!) as! [String: Any]
        
        ticker = Ticker(named: name, jsonDictionary: jsonDictionary)
    }

    func testInitializingFromJSON() {
        XCTAssertEqual("BTC", ticker.baseCurrency)
        XCTAssertEqual("PLN", ticker.counterCurrency)
        XCTAssertEqual(11273, ticker.max)
        XCTAssertEqual(10175.99, ticker.min)
        XCTAssertEqual(11273, ticker.last)
        XCTAssertEqual(11250, ticker.bid)
        XCTAssertEqual(11273, ticker.ask)
        XCTAssertEqual(11016.08, ticker.vwap)
        XCTAssertEqual(11273, ticker.average)
        XCTAssertEqual(1050.98805379, ticker.volume)
    }
    
    func testDescriptionPrintArguments() {
        XCTAssertEqual("Ticker BTC/PLN, max: 11273.0 PLN, min: 10175.99 PLN, last: 11273.0 PLN, bid: 11250.0 PLN, ask: 11273.0 PLN, vwap: 11016.08 PLN, average: 11273.0 PLN, volume: 1050.98805379", ticker.description(printArguments: []))
        
        XCTAssertEqual("Ticker BTC/PLN, max: 11273.0 PLN", ticker.description(printArguments: ["--max"]))
        XCTAssertEqual("Ticker BTC/PLN, min: 10175.99 PLN", ticker.description(printArguments: ["--min"]))
        XCTAssertEqual("Ticker BTC/PLN, last: 11273.0 PLN", ticker.description(printArguments: ["--last"]))
        XCTAssertEqual("Ticker BTC/PLN, bid: 11250.0 PLN", ticker.description(printArguments: ["--bid"]))
        XCTAssertEqual("Ticker BTC/PLN, ask: 11273.0 PLN", ticker.description(printArguments: ["--ask"]))
        XCTAssertEqual("Ticker BTC/PLN, vwap: 11016.08 PLN", ticker.description(printArguments: ["--vwap"]))
        XCTAssertEqual("Ticker BTC/PLN, average: 11273.0 PLN", ticker.description(printArguments: ["--average"]))
        XCTAssertEqual("Ticker BTC/PLN, volume: 1050.98805379", ticker.description(printArguments: ["--volume"]))
        
        XCTAssertEqual("Ticker BTC/PLN", ticker.description(printArguments: ["last"]))
        XCTAssertEqual("Ticker BTC/PLN, max: 11273.0 PLN, last: 11273.0 PLN", ticker.description(printArguments: ["--max", "--last"]))
    }
    
    static var allTests = [
        ("testInitializingFromJSON", testInitializingFromJSON)
    ]

}
