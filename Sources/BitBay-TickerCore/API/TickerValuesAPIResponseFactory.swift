import Foundation

public struct TickerValuesAPIResponseFactory {
    
    public static func makeTickerValuesAPIResponse(for apiTickerName: String) -> TickerValuesAPIResponse? {
        guard
            let url = URL(string: "https://bitbay.net/API/Public/\(apiTickerName)/ticker.json"),
            let jsonData = try? Data(contentsOf: url) else {
                return nil
        }
        
        return try? JSONDecoder().decode(TickerValuesAPIResponse.self, from: jsonData)
    }
    
}
