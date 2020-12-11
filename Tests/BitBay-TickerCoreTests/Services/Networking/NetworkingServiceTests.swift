import XCTest
@testable import BitBay_TickerCore

final class NetworkingServiceTests: XCTestCase {
    
    func testFetchingTickerValuesJSONFromAPI() throws {
        let url = URL(string: "https://api.bitbay.net/rest/trading/ticker/BTC-PLN")!
        
        let apiTickerValuesResponseJSON = NetworkingService().fetchData(url: url)
        
        XCTAssertNotNil(apiTickerValuesResponseJSON)
    }
    
    func testFetchingTickerStatisticsJSONFromAPI() throws {
        let url = URL(string: "https://api.bitbay.net/rest/trading/stats/BTC-PLN")!
        
        let apiTickerStatisticsResponseJSON = NetworkingService().fetchData(url: url)

        XCTAssertNotNil(apiTickerStatisticsResponseJSON)
    }
    
    func testFetchingExternalDataFail() throws {
        let externalData = NetworkingService().fetchData(url: URL(string: "https://TEST.THIS.WRONG.ADDRESS/BTC-PLN")!)
        
        XCTAssertNil(externalData)
    }
    
}
