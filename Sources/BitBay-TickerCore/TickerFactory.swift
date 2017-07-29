import Foundation

public struct TickerFactory {
    
    public static func makeTicker(named tickerName: String) -> Ticker? {
        guard
            TickerNameValidator().isValid(name: tickerName),
            let url = URL(string: "https://bitbay.net/API/Public/\(tickerName)/ticker.json"),
            let jsonData = try? Data(contentsOf: url),
            let jsonObject = try? JSONSerialization.jsonObject(with: jsonData),
            let jsonDictionary = jsonObject as? [String: Any] else { return nil }
        
        return Ticker(named: tickerName, jsonDictionary: jsonDictionary)
    }
    
}
