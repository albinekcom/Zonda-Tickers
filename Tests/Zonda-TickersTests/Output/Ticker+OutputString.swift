import XCTest
@testable import Zonda_Tickers

final class Ticker_OutputString: XCTestCase {
    
    // MARK: - Tests
    
    func test_outputString_forTickerWithFilledValues() {
        let ticker = Ticker(id: "btc-pln",
                            counterCurrencyFractionDigits: 2,
                            highestBid: 1111.111,
                            lowestAsk: 2222.222,
                            rate: 3333.333,
                            previousRate: 4444.444,
                            highestRate: 5555.555,
                            lowestRate: 6666.666,
                            volume: 7777.777,
                            volumeFractionDigits: 2,
                            average: 8888.888)
        
        let outputString = ticker.outputString(printArguments: usedPrintArguments, locale: Locale.americanEnglish)
        
        XCTAssertEqual("Ticker: BTC-PLN, highest bid: 1,111.11 PLN, lowest ask: 2,222.22 PLN, rate: 3,333.33 PLN, previous rate: 4,444.44 PLN, highest rate: 5,555.56 PLN, lowest rate: 6,666.67 PLN, volume: 7,777.78, volume value: 25,925,920.74 PLN, average: 8,888.89 PLN, change: -62.50%", outputString)
    }
    
    
    func test_outputString_forTickerWithEmptyValues() {
        let ticker = Ticker(id: "btc-pln",
                            counterCurrencyFractionDigits: 2,
                            highestBid: nil,
                            lowestAsk: nil,
                            rate: nil,
                            previousRate: nil,
                            highestRate: nil,
                            lowestRate: nil,
                            volume: nil,
                            volumeFractionDigits: 2,
                            average: nil)
        
        let outputString = ticker.outputString(printArguments: usedPrintArguments, locale: Locale.americanEnglish)
        
        XCTAssertEqual("Ticker: BTC-PLN, highest bid: - PLN, lowest ask: - PLN, rate: - PLN, previous rate: - PLN, highest rate: - PLN, lowest rate: - PLN, volume: -, volume value: - PLN, average: - PLN, change: -", outputString)
    }
    
    // MARK: - Helpers
    
    private let usedPrintArguments: [PrintArgument] = [.highestBid,
                                                       .lowestAsk,
                                                       .rate,
                                                       .previousRate,
                                                       .highestRate,
                                                       .lowestRate,
                                                       .volume,
                                                       .volumeValue,
                                                       .average,
                                                       .change]
    
}
