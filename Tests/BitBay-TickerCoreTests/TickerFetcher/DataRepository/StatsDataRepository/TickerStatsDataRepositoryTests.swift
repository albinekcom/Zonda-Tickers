import XCTest
@testable import BitBay_TickerCore

final class TickerStatsDataRepositoryTests: XCTestCase {
    
    func testFetchingNilFromAPI() throws {
        let tickerStatsDataRepository = TickerStatsDataRepository(apiDataRepository: MockTickerStatsAPIDataRepositoryReturningNil())
        
        let dataResponse = tickerStatsDataRepository.fetchTickerStatsData(tickerIdentifier: "BTC-PLN")
        
        XCTAssertNil(dataResponse)
    }
    
    func testFetchingProperStatsAPIData() throws {
        let tickerStatsDataRepository = TickerStatsDataRepository(apiDataRepository: MockTickerStatsAPIDataRepositoryReturningProperDataResponse())
        
        let dataResponse = tickerStatsDataRepository.fetchTickerStatsData(tickerIdentifier: "BTC-PLN")
        
        XCTAssertEqual(TickerStatsData(highestRate: 2, lowestRate: 3, volume: 4, average: 5), dataResponse)
    }
}

// MARK: - Helpers

private struct MockTickerStatsAPIDataRepositoryReturningNil: TickerStatsAPIDataRepositoryPort {

    func fetchTickerStatsAPIData(tickerIdentifier: String) -> TickerStatsAPIDataResponse? { nil }

}

private struct MockTickerStatsAPIDataRepositoryReturningProperDataResponse: TickerStatsAPIDataRepositoryPort {

    func fetchTickerStatsAPIData(tickerIdentifier: String) -> TickerStatsAPIDataResponse? {
        TickerStatsAPIDataResponse(status: "status", stats: TickerStatsAPIDataResponse.StatisticsAPIResponse(m: "1", h: "2", l: "3", v: "4", r24h: "5"))
    }

}
