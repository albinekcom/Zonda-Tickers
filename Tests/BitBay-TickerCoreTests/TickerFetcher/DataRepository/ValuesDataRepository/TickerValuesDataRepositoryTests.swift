import XCTest
@testable import BitBay_TickerCore

final class TickerValuesDataRepositoryTests: XCTestCase {
    
    func testFetchingNilFromAPI() throws {
        let tickerValuesDataRepository = TickerValuesDataRepository(apiDataRepository: MockTickerValuesAPIDataRepositoryReturningNil())
        
        let dataResponse = tickerValuesDataRepository.fetchTickerValuesData(tickerIdentifier: "BTC-PLN")
        
        XCTAssertNil(dataResponse)
    }
    
    func testFetchingProperStatsAPIData() throws {
        let tickerValuesDataRepository = TickerValuesDataRepository(apiDataRepository: MockTickerValuesAPIDataRepositoryReturningProperDataResponse())
        
        let dataResponse = tickerValuesDataRepository.fetchTickerValuesData(tickerIdentifier: "BTC-PLN")
        
        XCTAssertEqual(TickerValuesData(highestBid: 1, lowestAsk: 2, rate: 3, previousRate: 4), dataResponse)
    }
}

// MARK: - Helpers

private struct MockTickerValuesAPIDataRepositoryReturningNil: TickerValuesAPIDataRepositoryPort {

    func fetchTickerValuesAPIData(tickerIdentifier: String) -> TickerValuesAPIDataResponse? { nil }

}

private struct MockTickerValuesAPIDataRepositoryReturningProperDataResponse: TickerValuesAPIDataRepositoryPort {

    func fetchTickerValuesAPIData(tickerIdentifier: String) -> TickerValuesAPIDataResponse? {
        TickerValuesAPIDataResponse(status: nil, ticker: TickerValuesAPIDataResponse.TickerAPIDataResponse(market: nil, time: nil, highestBid: "1", lowestAsk: "2", rate: "3", previousRate: "4"))
    }

}
