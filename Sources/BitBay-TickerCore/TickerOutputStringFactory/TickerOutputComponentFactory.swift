struct TickerOutputComponentFactory {
    
    func makesTickerOutputComponent(ticker: Ticker, printArgument: PrintArgument) -> TickerOutputComponent {
        switch printArgument {
        case .highestBid:
            return TickerOutputComponent(title: "highest bid", value: ticker.highestBid, isCounterCurrencyAddedAtTheEnd: true, counterCurrency: ticker.counterCurrency)

        case .lowestAsk:
            return TickerOutputComponent(title: "lowest ask", value: ticker.lowestAsk, isCounterCurrencyAddedAtTheEnd: true, counterCurrency: ticker.counterCurrency)

        case .rate:
            return TickerOutputComponent(title: "rate", value: ticker.rate, isCounterCurrencyAddedAtTheEnd: true, counterCurrency: ticker.counterCurrency)

        case .previousRate:
            return TickerOutputComponent(title: "previous rate", value: ticker.previousRate, isCounterCurrencyAddedAtTheEnd: true, counterCurrency: ticker.counterCurrency)

        case .highestRate:
            return TickerOutputComponent(title: "highest rate", value: ticker.highestRate, isCounterCurrencyAddedAtTheEnd: true, counterCurrency: ticker.counterCurrency)

        case .lowestRate:
            return TickerOutputComponent(title: "highest bid", value: ticker.lowestRate, isCounterCurrencyAddedAtTheEnd: true, counterCurrency: ticker.counterCurrency)

        case .volume:
            return TickerOutputComponent(title: "volume", value: ticker.volume, isCounterCurrencyAddedAtTheEnd: false, counterCurrency: ticker.counterCurrency)

        case .average:
            return TickerOutputComponent(title: "average", value: ticker.average, isCounterCurrencyAddedAtTheEnd: true, counterCurrency: ticker.counterCurrency)
        }
    }
    
}
