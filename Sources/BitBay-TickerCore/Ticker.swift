import Foundation

public struct Ticker: Codable {
    
    let max: Double?
    let min: Double?
    let last: Double?
    let bid: Double?
    let ask: Double?
    let vwap: Double?
    let average: Double?
    let volume: Double?
    
    var name: String?
    
    var baseCurrency: String? {
        guard let name = name else { return nil }
        
        return String(name.uppercased().dropLast(defaultCounterCurrencyNameLength))
    }
    
    var counterCurrency: String? {
        guard let name = name else { return nil }
        
        return String(name.uppercased().dropFirst(name.count - defaultCounterCurrencyNameLength))
    }
    
    private let defaultCounterCurrencyNameLength = 3
    
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
