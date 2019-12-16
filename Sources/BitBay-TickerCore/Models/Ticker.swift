public struct Ticker {
    
    public let id: String
    
    public private(set) var highestBid: Double?
    public private(set) var lowestAsk: Double?
    public private(set) var rate: Double?
    public private(set) var previousRate: Double?
    public private(set) var highestRate: Double?
    public private(set) var lowestRate: Double?
    public private(set) var volume: Double?
    public private(set) var average: Double?
    
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
        guard TickerValidator.isIdValid(id) else { return nil }
        
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
