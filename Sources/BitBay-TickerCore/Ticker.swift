public struct Ticker {
    
    private let defaultCounterCurrencyNameLength = 3
    
    let baseCurrency: String
    let counterCurrency: String
    
    let max: Double?
    let min: Double?
    let last: Double?
    let bid: Double?
    let ask: Double?
    let vwap: Double?
    let average: Double?
    let volume: Double?
    
    public init(named name: String, jsonDictionary: [String: Any]) {
        baseCurrency = String(name.uppercased().dropLast(defaultCounterCurrencyNameLength))
        counterCurrency = String(name.uppercased().dropFirst(name.count - defaultCounterCurrencyNameLength))
        
        max = jsonDictionary["max"] as? Double
        min = jsonDictionary["min"] as? Double
        last = jsonDictionary["last"] as? Double
        bid = jsonDictionary["bid"] as? Double
        ask = jsonDictionary["ask"] as? Double
        vwap = jsonDictionary["vwap"] as? Double
        average = jsonDictionary["average"] as? Double
        volume = jsonDictionary["volume"] as? Double
    }
    
    public func description(printArguments: [String]) -> String {
        var desc = "Ticker \(baseCurrency)/\(counterCurrency)"
        
        let showAll = printArguments.count == 0
        
        if let max = max, printArguments.contains("--max") || showAll {
            desc += ", max: \(max) \(counterCurrency)"
        }
        
        if let min = min, printArguments.contains("--min") || showAll {
            desc += ", min: \(min) \(counterCurrency)"
        }
        
        if let last = last, printArguments.contains("--last") || showAll {
            desc += ", last: \(last) \(counterCurrency)"
        }
        
        if let bid = bid, printArguments.contains("--bid") || showAll {
            desc += ", bid: \(bid) \(counterCurrency)"
        }
        
        if let ask = ask, printArguments.contains("--ask") || showAll {
            desc += ", ask: \(ask) \(counterCurrency)"
        }
        
        if let vwap = vwap, printArguments.contains("--vwap") || showAll {
            desc += ", vwap: \(vwap) \(counterCurrency)"
        }
        
        if let average = average, printArguments.contains("--average") || showAll {
            desc += ", average: \(average) \(counterCurrency)"
        }
        
        if let volume = volume, printArguments.contains("--volume") || showAll {
            desc += ", volume: \(volume)"
        }
        
        return desc
    }
    
}
