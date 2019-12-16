public struct Printer {
    
    public init() {
        
    }
    
    public func prettyDescription(for ticker: Ticker, printArguments: [PrintArgument]) -> String {
        var description = "Ticker \(ticker.id)"
        
        let usedPrintArguments: [PrintArgument]
        
        if printArguments.isEmpty {
            usedPrintArguments = PrintArgument.allCases
        } else {
            usedPrintArguments = printArguments
        }
        
        let valueDescriptions = usedPrintArguments.map { prettyValueDescription(for: ticker, printArgument: $0) }
        let valueDescriptionsInOneString = valueDescriptions.joined(separator: ", ")
        
        if valueDescriptionsInOneString.isEmpty == false {
            description += ", \(valueDescriptionsInOneString)"
        }
        
        
        return description
    }
    
    private func prettyValueDescription(for ticker: Ticker, printArgument: PrintArgument) -> String {
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
            title = "highest bid"
            value = ticker.volume
            isCounterCurrencyAddedAtTheEnd = true
            
        case .average:
            title = "average"
            value = ticker.highestBid
            isCounterCurrencyAddedAtTheEnd = false
        }
        
        let valueString: String
        
        if let value = value {
            valueString = String(value)
        } else {
            valueString = "-"
        }
        
        var description: String = "\(title): \(valueString)"
        
        if isCounterCurrencyAddedAtTheEnd, let counterCurrency = ticker.counterCurrency {
            description += " \(counterCurrency)"
        }
        
        return description
    }
    
}
