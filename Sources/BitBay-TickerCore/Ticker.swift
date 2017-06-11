public struct Ticker {
    
    private let name: String
    
    var baseCurrency: String {
        return String(name.characters.dropLast(3))
    }
    
    var counterCurrency: String {
        return String(name.characters.dropFirst(3))
    }
    
    let max: Double?
    let min: Double?
    let last: Double?
    let bid: Double?
    let ask: Double?
    let vwap: Double?
    let average: Double?
    let volume: Double?
    
    public init(named name: String, jsonDictionary: [String: Any]) {
        self.name = name
        
        max = jsonDictionary["max"] as? Double
        min = jsonDictionary["min"] as? Double
        last = jsonDictionary["last"] as? Double
        bid = jsonDictionary["bid"] as? Double
        ask = jsonDictionary["ask"] as? Double
        vwap = jsonDictionary["vwap"] as? Double
        average = jsonDictionary["average"] as? Double
        volume = jsonDictionary["volume"] as? Double
    }
    
}

extension Ticker: CustomStringConvertible {
    
    public var description: String {
        var desc = "Ticker \(baseCurrency)/\(counterCurrency)"
        
        if let last = last {
            desc += ", last: \(last)\t\(counterCurrency)"
        }
        
        return desc
    }
    
}
