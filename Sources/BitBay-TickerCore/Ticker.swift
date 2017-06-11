struct Ticker {
    
    let name: String
    
    let max: Double?
    let min: Double?
    let last: Double?
    let bid: Double?
    let ask: Double?
    let vwap: Double?
    let average: Double?
    let volume: Double?
    
    init(named name: String, jsonDictionary: [String: Any]) {
        self.name = name
        
        self.max = jsonDictionary["max"] as? Double
        self.min = jsonDictionary["min"] as? Double
        self.last = jsonDictionary["last"] as? Double
        self.bid = jsonDictionary["bid"] as? Double
        self.ask = jsonDictionary["ask"] as? Double
        self.vwap = jsonDictionary["vwap"] as? Double
        self.average = jsonDictionary["average"] as? Double
        self.volume = jsonDictionary["volume"] as? Double
    }
    
}
