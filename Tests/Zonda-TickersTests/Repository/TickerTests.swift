import XCTest
@testable import Zonda_Tickers

final class TickerTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_baseCurrencyId() {
        XCTAssertEqual("btc", ticker(tickerId: "btc-pln").baseCurrencyId)
        XCTAssertNil(ticker(tickerId: "btc/pln").baseCurrencyId)
        XCTAssertNil(ticker(tickerId: "btc").baseCurrencyId)
        XCTAssertNil(ticker(tickerId: "btc-").baseCurrencyId)
    }

    func test_counterCurrencyId() {
        XCTAssertEqual("pln", ticker(tickerId: "btc-pln").counterCurrencyId)
        XCTAssertNil(ticker(tickerId: "btc/pln").counterCurrencyId)
        XCTAssertNil(ticker(tickerId: "btc").counterCurrencyId)
        XCTAssertNil(ticker(tickerId: "-btc").counterCurrencyId)
    }
    
    func test_initFromAPIResponses_withNilItems() {
        let ticker = Ticker(id: "btc-pln", apiTickerValuesItem: nil, apiTickerStatisticsItem: nil)
        
        XCTAssertEqual("btc-pln", ticker.id)
        XCTAssertEqual(2, ticker.counterCurrencyScale)
        XCTAssertNil(ticker.highestBid)
        XCTAssertNil(ticker.lowestAsk)
        XCTAssertNil(ticker.rate)
        XCTAssertNil(ticker.previousRate)
        XCTAssertNil(ticker.highestRate)
        XCTAssertNil(ticker.lowestRate)
        XCTAssertNil(ticker.volume)
        XCTAssertNil(ticker.average)
    }
    
    func test_initFromAPIResponses_withFilledItems() {
        let ticker = Ticker(id: "btc-pln",
                            apiTickerValuesItem: .init(market: .init(code: "",
                                                                     first: .init(currency: "", minOffer: "", scale: 2),
                                                                     second: .init(currency: "", minOffer: "", scale: 3)),
                                                       time: "",
                                                       highestBid: "111.111",
                                                       lowestAsk: "222.222",
                                                       rate: "333.333",
                                                       previousRate: "444.444"),
                            apiTickerStatisticsItem: .init(m: "",
                                                           h: "555.555",
                                                           l: "666.666",
                                                           v: "777.777",
                                                           r24h: "888.888"))
        
        XCTAssertEqual("btc-pln", ticker.id)
        XCTAssertEqual(3, ticker.counterCurrencyScale)
        XCTAssertEqual(111.111, ticker.highestBid)
        XCTAssertEqual(222.222, ticker.lowestAsk)
        XCTAssertEqual(333.333, ticker.rate)
        XCTAssertEqual(444.444, ticker.previousRate)
        XCTAssertEqual(555.555, ticker.highestRate)
        XCTAssertEqual(666.666, ticker.lowestRate)
        XCTAssertEqual(777.777, ticker.volume)
        XCTAssertEqual(888.888, ticker.average)
    }
    
    // MARK: - Helpers
    
    private func ticker(tickerId: String) -> Ticker {
        .init(id: tickerId,
              apiTickerValuesItem: nil,
              apiTickerStatisticsItem: nil)
    }

}
