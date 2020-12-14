import XCTest
@testable import BitBay_TickerCore

final class TickerAPIFetcherTests: XCTestCase {
    
    func testFetcherWithAvoidingFetching() throws {
        let tickerAPIFetcher = TickerAPIFetcher(tickerValuesAPIDataRepository: MockTickerValuesDataReturningData(), tickerStatsAPIDataRepository: MockTickerStatsDataReturningData())

        let result = tickerAPIFetcher.fetchTicker(tickerIdentifier: "BTC-PLN", shouldFetchValues: false, shouldFetchStats: false)

        XCTAssertEqual(.success(Ticker(id: "BTC-PLN", highestBid: nil, lowestAsk: nil, rate: nil, previousRate: nil, highestRate: nil, lowestRate: nil, volume: nil, average: nil)), result)
    }
    
    func testReturningFetchingValuesDataError() throws {
        let tickerAPIFetcher = TickerAPIFetcher(tickerValuesAPIDataRepository: MockTickerValuesDataReturningNil(), tickerStatsAPIDataRepository: MockTickerStatsDataReturningData())

        let result = tickerAPIFetcher.fetchTicker(tickerIdentifier: "BTC-PLN", shouldFetchValues: true, shouldFetchStats: false)

        XCTAssertEqual(.failure(TickerFetcherError.fetchingValuesData), result)
    }
    
    func testReturningFetchingStatsDataError() throws {
        let tickerAPIFetcher = TickerAPIFetcher(tickerValuesAPIDataRepository: MockTickerValuesDataReturningData(), tickerStatsAPIDataRepository: MockTickerStatsDataReturningNil())

        let result = tickerAPIFetcher.fetchTicker(tickerIdentifier: "BTC-PLN", shouldFetchValues: false, shouldFetchStats: true)

        XCTAssertEqual(.failure(TickerFetcherError.fetchingStatsData), result)
    }
    
    func testReturningSuccess() throws {
        let tickerAPIFetcher = TickerAPIFetcher(tickerValuesAPIDataRepository: MockTickerValuesDataReturningData(), tickerStatsAPIDataRepository: MockTickerStatsDataReturningData())

        let result = tickerAPIFetcher.fetchTicker(tickerIdentifier: "BTC-PLN", shouldFetchValues: true, shouldFetchStats: true)

        XCTAssertEqual(.success(Ticker(id: "BTC-PLN", highestBid: 1, lowestAsk: 2, rate: 3, previousRate: 4, highestRate: 5, lowestRate: 6, volume: 7, average: 8)), result)
    }
    
}

// MARK: - Helpers

private struct MockTickerValuesDataReturningNil: TickerValuesAPIDataRepositoryPort {
    
    func fetchTickerValuesAPIData(tickerIdentifier: String) -> TickerValuesAPIDataResponse? { nil }
    
}

private struct MockTickerValuesDataReturningData: TickerValuesAPIDataRepositoryPort {

    func fetchTickerValuesAPIData(tickerIdentifier: String) -> TickerValuesAPIDataResponse? { TickerValuesAPIDataResponse(status: nil, ticker: TickerValuesAPIDataResponse.TickerAPIDataResponse(market: nil, time: nil, highestBid: "1", lowestAsk: "2", rate: "3", previousRate: "4")) }
}

private struct MockTickerStatsDataReturningNil: TickerStatsAPIDataRepositoryPort {
    
    func fetchTickerStatsAPIData(tickerIdentifier: String) -> TickerStatsAPIDataResponse? { nil }

}

private struct MockTickerStatsDataReturningData: TickerStatsAPIDataRepositoryPort {
    
    func fetchTickerStatsAPIData(tickerIdentifier: String) -> TickerStatsAPIDataResponse? { TickerStatsAPIDataResponse(status: nil, stats: TickerStatsAPIDataResponse.StatisticsAPIResponse(m: "9", h: "5", l: "6", v: "7", r24h: "8")) }

}
