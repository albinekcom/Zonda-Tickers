import Foundation

public struct TickerFactory {
    
    public static func makeTicker(named tickerName: String) -> Ticker? {
        guard
            TickerNameValidator.isValid(name: tickerName),
            let url = URL(string: "https://bitbay.net/API/Public/\(tickerName)/ticker.json"),
            let jsonData = try? Data(contentsOf: url) else { return nil }
        
        var ticker = try? JSONDecoder().decode(Ticker.self, from: jsonData)
        ticker?.name = tickerName
        
        return ticker
    }
    
}
