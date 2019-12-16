public struct Ticker {
    
    public let id: String
    
    var highestBid: Double?
    var lowestAsk: Double?
    var rate: Double?
    var previousRate: Double?
    var highestRate: Double?
    var lowestRate: Double?
    var volume: Double?
    var average: Double?
    
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
    
    public init?(id: String) {
        guard TickerNameValidator.isValid(name: id) else { return nil }
        
        self.id = id.uppercased()
    }
    
    public mutating func setUpValues(using tickerValuesAPIResponse: TickerValuesAPIResponse) {
        highestBid = tickerValuesAPIResponse.ticker?.highestBid.doubleValue
        lowestAsk = tickerValuesAPIResponse.ticker?.lowestAsk.doubleValue
        rate = tickerValuesAPIResponse.ticker?.rate.doubleValue
        previousRate = tickerValuesAPIResponse.ticker?.previousRate.doubleValue
    }
    
    public mutating func setUpStatistics(using tickerStatisticsAPIResponse: TickerStatisticsAPIResponse) {
        highestRate = tickerStatisticsAPIResponse.stats?.h.doubleValue
        lowestRate = tickerStatisticsAPIResponse.stats?.l.doubleValue
        volume = tickerStatisticsAPIResponse.stats?.v.doubleValue
        average = tickerStatisticsAPIResponse.stats?.r24h.doubleValue
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
        
        if let highestRate = highestRate, printArguments.contains("--highestRate") || showAll {
            desc += ", highest rate: \(highestRate) \(counterCurrency)"
        }
        
        if let lowestRate = lowestRate, printArguments.contains("--lowestRate") || showAll {
            desc += ", lowest rate: \(lowestRate) \(counterCurrency)"
        }
        
        if let volume = volume, printArguments.contains("--volume") || showAll {
            desc += ", volume: \(volume)"
        }
        
        if let average = average, printArguments.contains("--average") || showAll {
            desc += ", average: \(average) \(counterCurrency)"
        }
        
        return desc
    }
    
}
