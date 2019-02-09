import Foundation

public struct TickerValuesAPIResponse: Codable {
    
    public let max: Double?
    public let min: Double?
    public let last: Double?
    public let bid: Double?
    public let ask: Double?
    public let vwap: Double?
    public let average: Double?
    public let volume: Double?
    
}
