import XCTest
@testable import BitBay_TickerCore

final class TickerTests: XCTestCase {

    func testInitializingFromJSON() {
        let name = "BTCPLN"
        let jsonString = "{\"max\":11273,\"min\":10175.99,\"last\":11273,\"bid\":11250,\"ask\":11273,\"vwap\":11016.08,\"average\":11273,\"volume\":1050.98805379}"
        let jsonDictionary = try! JSONSerialization.jsonObject(with: jsonString.data(using: .utf8)!, options: []) as! [String: Any]

        let ticker = Ticker(named: name, jsonDictionary: jsonDictionary)
        
        XCTAssertEqual("BTCPLN", ticker.name)
        XCTAssertEqual(11273, ticker.max)
        XCTAssertEqual(10175.99, ticker.min)
        XCTAssertEqual(11273, ticker.last)
        XCTAssertEqual(11250, ticker.bid)
        XCTAssertEqual(11273, ticker.ask)
        XCTAssertEqual(11016.08, ticker.vwap)
        XCTAssertEqual(11273, ticker.average)
        XCTAssertEqual(1050.98805379, ticker.volume)
    }


    static var allTests = [
        ("testInitializingFromJSON", testInitializingFromJSON)
    ]

}
