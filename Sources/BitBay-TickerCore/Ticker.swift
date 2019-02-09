import Foundation

public struct Ticker {
    
    public let name: String
    
    public var max: Double?
    public var min: Double?
    public var last: Double?
    public var bid: Double?
    public var ask: Double?
    public var vwap: Double?
    public var average: Double?
    public var volume: Double?
    
    public var baseCurrency: String? {
        guard let range = name.range(of: "/") else { return nil }
        
        return String(name[..<range.lowerBound]).uppercased()
    }
    
    public var counterCurrency: String? {
        guard let range = name.range(of: "/") else { return nil }
        
        return String(name[name.index(range.lowerBound, offsetBy: 1)...]).uppercased()
    }
    
    public var apiTickerName: String? {
        guard let baseCurrency = baseCurrency else { return nil }
        guard let counterCurrency = counterCurrency else { return nil }
        
        return baseCurrency + counterCurrency
    }
    
    public init(name: String) {
        self.name = name
    }
    
    public mutating func setUpValues(using tickerValuesAPIResponse: TickerValuesAPIResponse?) {
        max = tickerValuesAPIResponse?.max
        min = tickerValuesAPIResponse?.min
        last = tickerValuesAPIResponse?.last
        bid = tickerValuesAPIResponse?.bid
        ask = tickerValuesAPIResponse?.ask
        vwap = tickerValuesAPIResponse?.vwap
        average = tickerValuesAPIResponse?.average
        volume = tickerValuesAPIResponse?.volume
    }
}
    
public extension Ticker {
    
    func description(printArguments: [String]) -> String {
        guard let baseCurrency = baseCurrency, let counterCurrency = counterCurrency else { return "" }
        
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
