struct TickersFactory {
    
    private static let defaultCounterCurrencyScale = 2
    
    static func make(tickerIds: [String],
                     tickersValuesAPIResponse: TickersValuesAPIResponse?,
                     tickersStatisticsAPIResponse: TickersStatisticsAPIResponse?) -> [Ticker] {
        tickerIds.map {
            let apiTickerId = $0.uppercased()
            
            return Ticker(id: $0,
                          counterCurrencyScale: tickersValuesAPIResponse?.items[apiTickerId]?.market.second.scale ?? defaultCounterCurrencyScale,
                          highestBid: tickersValuesAPIResponse?.items[apiTickerId]?.highestBid.double,
                          lowestAsk: tickersValuesAPIResponse?.items[apiTickerId]?.lowestAsk.double,
                          rate: tickersValuesAPIResponse?.items[apiTickerId]?.previousRate.double,
                          previousRate: tickersValuesAPIResponse?.items[apiTickerId]?.rate.double,
                          highestRate: tickersStatisticsAPIResponse?.items[apiTickerId]?.h.double,
                          lowestRate: tickersStatisticsAPIResponse?.items[apiTickerId]?.l.double,
                          volume: tickersStatisticsAPIResponse?.items[apiTickerId]?.v.double,
                          average: tickersStatisticsAPIResponse?.items[apiTickerId]?.r24h.double)
        }
    }
    
}

private extension Optional where Wrapped == String {
    
    var double: Double? {
        guard let self = self else { return nil }
        
        return Double(self)
    }
    
}
