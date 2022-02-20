struct Ticker {
    
    let id: String
    
    let counterCurrencyScale: Int
    
    let highestBid: Double?
    let lowestAsk: Double?
    let rate: Double?
    let previousRate: Double?
    let highestRate: Double?
    let lowestRate: Double?
    let volume: Double?
    let average: Double?
    
}

extension Ticker {
    
    var baseCurrencyId: String? { currencyIdentifiers?.first }
    var counterCurrencyId: String? { currencyIdentifiers?.last }

    private var currencyIdentifiers: [String]? {
        let seperatedCurrencyIdentifiers = id.components(separatedBy: "-")
        
        return (seperatedCurrencyIdentifiers.count == 2 &&
                !seperatedCurrencyIdentifiers[0].isEmpty &&
                !seperatedCurrencyIdentifiers[1].isEmpty) ? seperatedCurrencyIdentifiers : nil
    }
    
}
