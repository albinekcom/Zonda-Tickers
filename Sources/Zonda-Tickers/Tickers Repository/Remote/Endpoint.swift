import Foundation

enum Endpoint: String {
    
    case ticker
    case stats
    
    var url: URL {
        URL(string: "https://api.zonda.exchange/rest/trading/\(rawValue)")!
    }
    
}
