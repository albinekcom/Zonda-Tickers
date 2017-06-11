import Foundation

public struct TickerFactory {
    
    public static func makeTicker(named tickerName: String) -> Ticker {
        let url = URL(string: "https://bitbay.net/API/Public/\(tickerName)/ticker.json")!
        
        let jsonData = try! Data(contentsOf: url)
        let jsonDictionary = try! JSONSerialization.jsonObject(with: jsonData) as! [String: Any]
        
        return Ticker(named: tickerName, jsonDictionary: jsonDictionary)
    }
    
}
