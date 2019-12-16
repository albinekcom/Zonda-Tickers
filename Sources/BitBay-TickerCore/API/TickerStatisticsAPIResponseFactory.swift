import Foundation

public struct TickerStatisticsAPIResponseFactory {
    
    private static let endpointString = "https://api.bitbay.net/rest/trading/stats/"
    
    public static func makeTickerStatisticsAPIResponse(for apiTickerId: String) -> TickerStatisticsAPIResponse? {
        guard
            let url = URL(string: "\(endpointString)\(apiTickerId)"),
            let jsonData = try? Data(contentsOf: url) else {
                return nil
        }
        
        return try? JSONDecoder().decode(TickerStatisticsAPIResponse.self, from: jsonData)
    }
    
}
