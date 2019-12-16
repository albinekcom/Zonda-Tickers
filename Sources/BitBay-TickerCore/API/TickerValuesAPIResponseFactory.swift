import Foundation

public struct TickerValuesAPIResponseFactory {
    
    private static let endpointString = "https://api.bitbay.net/rest/trading/ticker/"
    
    public static func makeTickerValuesAPIResponse(for apiTickerId: String) -> TickerValuesAPIResponse? {
        guard
            let url = URL(string: "\(endpointString)\(apiTickerId)"),
            let jsonData = try? Data(contentsOf: url) else {
                return nil
        }
        
        return try? JSONDecoder().decode(TickerValuesAPIResponse.self, from: jsonData)
    }
    
}
