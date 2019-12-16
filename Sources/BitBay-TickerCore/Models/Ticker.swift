public struct Ticker {
    
    public let id: String
    
    var highestBid: Double?
    var lowestAsk: Double?
    var rate: Double?
    var previousRate: Double?
    
    public var baseCurrency: String? {
        currencyIdentifiers.first
    }
    
    public var counterCurrency: String? {
        currencyIdentifiers.last
    }
    
    public var isAnyValueFilled: Bool {
        return  highestBid != nil ||
                lowestAsk != nil ||
                rate != nil ||
                previousRate != nil
    }
    
    public init(id: String) {
        self.id = id.uppercased()
    }
    
    public mutating func setUpValues(using tickerValuesAPIResponse: TickerValuesAPIResponse) {
        highestBid = tickerValuesAPIResponse.ticker?.highestBid.doubleValue
        lowestAsk = tickerValuesAPIResponse.ticker?.lowestAsk.doubleValue
        rate = tickerValuesAPIResponse.ticker?.rate.doubleValue
        previousRate = tickerValuesAPIResponse.ticker?.previousRate.doubleValue
    }
    
    private var currencyIdentifiers: [String] {
        id.components(separatedBy: "-")
    }
}
    
public extension Ticker {
    
    func description(printArguments: [String]) -> String {
        guard let counterCurrency = counterCurrency else { return "" }
        
        var desc = "Ticker \(id)"
        
        let showAll = printArguments.count == 0
        
        if let highestBid = highestBid, printArguments.contains("--highestBid") || showAll {
            desc += ", highest bid: \(highestBid) \(counterCurrency)"
        }
        
        if let lowestAsk = lowestAsk, printArguments.contains("--lowestAsk") || showAll {
            desc += ", lowest ask: \(lowestAsk) \(counterCurrency)"
        }
        
        if let rate = rate, printArguments.contains("--rate") || showAll {
            desc += ", rate: \(rate) \(counterCurrency)"
        }
        
        if let previousRate = previousRate, printArguments.contains("--previousRate") || showAll {
            desc += ", previous rate: \(previousRate) \(counterCurrency)"
        }
        
        return desc
    }
    
}
