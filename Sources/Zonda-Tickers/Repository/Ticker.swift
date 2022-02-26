struct Ticker {
    
    let id: String
    
    let counterCurrencyFractionDigits: Int
    
    let highestBid: Double?
    let lowestAsk: Double?
    let rate: Double?
    let previousRate: Double?
    let highestRate: Double?
    let lowestRate: Double?
    let volume: Double?
    let volumeFractionDigits: Int
    let average: Double?
    
}

extension Ticker {
    
    init(id: String,
         apiTickerValuesItem: TickersValuesAPIResponse.Item?,
         apiTickerStatisticsItem: TickersStatisticsAPIResponse.Item?) {
        self.id = id
        
        counterCurrencyFractionDigits = apiTickerValuesItem?.market.second.scale ?? 2
        
        highestBid = apiTickerValuesItem?.highestBid.double
        lowestAsk = apiTickerValuesItem?.lowestAsk.double
        rate = apiTickerValuesItem?.rate.double
        previousRate = apiTickerValuesItem?.previousRate.double
        highestRate = apiTickerStatisticsItem?.h.double
        lowestRate = apiTickerStatisticsItem?.l.double
        volume = apiTickerStatisticsItem?.v.double
        volumeFractionDigits = apiTickerStatisticsItem?.v?.components(separatedBy: ".").last?.count ?? 2
        average = apiTickerStatisticsItem?.r24h.double
    }
    
}

extension Ticker {
    
    var baseCurrencyId: String? { currencyIdentifiers?.0 }
    var counterCurrencyId: String? { currencyIdentifiers?.1 }

    private var currencyIdentifiers: (String, String)? {
        let seperatedCurrencyIdentifiers = id.components(separatedBy: "-")
        
        return (seperatedCurrencyIdentifiers.count == 2 &&
                !seperatedCurrencyIdentifiers[0].isEmpty &&
                !seperatedCurrencyIdentifiers[1].isEmpty) ? (seperatedCurrencyIdentifiers[0], seperatedCurrencyIdentifiers[1]) : nil
    }
    
}

private extension Optional where Wrapped == String {
    
    var double: Double? {
        guard let self = self else { return nil }
        
        return Double(self)
    }
    
}
