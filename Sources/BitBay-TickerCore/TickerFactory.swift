import Foundation

public struct TickerFactory {
    
    public static func makeTicker(named tickerName: String) -> Ticker? {
        guard TickerNameValidator().isValid(name: tickerName) else { return nil }
        
        guard let url = URL(string: "https://bitbay.net/API/Public/\(tickerName)/ticker.json") else { return nil }
        guard let jsonData = try? Data(contentsOf: url) else { return nil }
        guard let jsonObject = try? JSONSerialization.jsonObject(with: jsonData) else { return nil }
        guard let jsonDictionary = jsonObject as? [String: Any] else { return nil }
        
        return Ticker(named: tickerName, jsonDictionary: jsonDictionary)
    }
    
}
