struct Ticker {
    
    let id: String
    
    let secondCurrencyId: String
    let secondCurrencyFractionDigitsCount: Int
    
    let average: Double?
    let highestBid: Double?
    let highestRate: Double?
    let lowestAsk: Double?
    let lowestRate: Double?
    let previousRate: Double?
    let rate: Double?
    let volume: Double?
    
}

extension Ticker {
    
    var change: Double? {
        guard let average = average,
              let rate = rate else { return nil }
        
        return (rate - average) / average
    }
    
    var volumeValue: Double? {
        guard let volume = volume,
              let rate = rate else { return nil }
        
        return volume * rate
    }
    
}
