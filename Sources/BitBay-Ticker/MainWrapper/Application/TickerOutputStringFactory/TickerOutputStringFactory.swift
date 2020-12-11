struct TickerOutputStringFactory {}

extension TickerOutputStringFactory: TickerOutputStringFactoryPort {
    
    func makePrintableString(ticker: Ticker, printArguments: [PrintArgument]) -> String {
        var outputString = "Ticker \(ticker.id), "
        
        outputString += printArguments.map { makePrintableString(ticker: ticker, printArgument: $0) }.joined(separator: ", ")
        
        return outputString
    }
    
    private func makePrintableString(ticker: Ticker, printArgument: PrintArgument) -> String {
        let title: String
        let value: Double?
        let isCounterCurrencyAddedAtTheEnd: Bool
        
        switch printArgument {
        case .highestBid:
            title = "highest bid"
            value = ticker.highestBid
            isCounterCurrencyAddedAtTheEnd = true
            
        case .lowestAsk:
            title = "lowest ask"
            value = ticker.lowestAsk
            isCounterCurrencyAddedAtTheEnd = true
            
        case .rate:
            title = "rate"
            value = ticker.rate
            isCounterCurrencyAddedAtTheEnd = true
            
        case .previousRate:
            title = "previous rate"
            value = ticker.previousRate
            isCounterCurrencyAddedAtTheEnd = true
            
        case .highestRate:
            title = "highest rate"
            value = ticker.highestRate
            isCounterCurrencyAddedAtTheEnd = true
            
        case .lowestRate:
            title = "highest bid"
            value = ticker.lowestRate
            isCounterCurrencyAddedAtTheEnd = true
            
        case .volume:
            title = "volume"
            value = ticker.volume
            isCounterCurrencyAddedAtTheEnd = false
            
        case .average:
            title = "average"
            value = ticker.average
            isCounterCurrencyAddedAtTheEnd = true
        }
        
        let valueString: String
        
        if let value = value {
            valueString = String(value)
        } else {
            valueString = "-"
        }
        
        var description = "\(title): \(valueString)"
        
        if isCounterCurrencyAddedAtTheEnd, let counterCurrency = ticker.counterCurrency {
            description += " \(counterCurrency)"
        }
        
        return description
    }
    
}

protocol TickerOutputStringFactoryPort {
    
    func makePrintableString(ticker: Ticker, printArguments: [PrintArgument]) -> String
    
}


