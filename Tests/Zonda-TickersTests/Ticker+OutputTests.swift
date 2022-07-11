import XCTest
@testable import Zonda_Tickers

final class Ticker_OutputTests: XCTestCase {
    
    func test_outputString_filledTicker() {
        let outputString = Ticker.stub.outputString(
            printArguments: [PrintArgument].stub,
            locale: .americanEnglish
        )
        
        XCTAssertEqual(
            "Ticker: BTC-PLN, highest bid: 22.22 PLN, lowest ask: 44.44 PLN, rate: 77.00 PLN, previous rate: 66.66 PLN, highest rate: 33.33 PLN, lowest rate: 55.55 PLN, volume: 88.888, volume value: 6,844.38 PLN, average: 11.00 PLN, change: +600.00%",
            outputString
        )
    }
    
    func test_outputString_emptyTicker() {
        let outputString = Ticker.emptyStub.outputString(
            printArguments: [PrintArgument].stub,
            locale: .americanEnglish
        )
        
        XCTAssertEqual(
            "Ticker: BTC-PLN, highest bid: - PLN, lowest ask: - PLN, rate: - PLN, previous rate: - PLN, highest rate: - PLN, lowest rate: - PLN, volume: -, volume value: - PLN, average: - PLN, change: -",
            outputString
        )
    }
    
}

private extension Array where Element == PrintArgument {
    
    static let stub: [PrintArgument] = [
        .highestBid,
        .lowestAsk,
        .rate,
        .previousRate,
        .highestRate,
        .lowestRate,
        .volume,
        .volumeValue,
        .average,
        .change
    ]
    
}
