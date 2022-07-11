@testable import Zonda_Tickers

extension Ticker {
    
    static var stub: Ticker {
        .init(
            id: "btc-pln",
            secondCurrencyId: "pln",
            secondCurrencyFractionDigitsCount: 2,
            average: 11,
            highestBid: 22.22,
            highestRate: 33.33,
            lowestAsk: 44.44,
            lowestRate: 55.55,
            previousRate: 66.66,
            rate: 77,
            volume: 88.888
        )
    }
    
    static var emptyStub: Ticker {
        .init(
            id: "btc-pln",
            secondCurrencyId: "pln",
            secondCurrencyFractionDigitsCount: 2,
            average: nil,
            highestBid: nil,
            highestRate: nil,
            lowestAsk: nil,
            lowestRate: nil,
            previousRate: nil,
            rate: nil,
            volume: nil
        )
    }
    
}
