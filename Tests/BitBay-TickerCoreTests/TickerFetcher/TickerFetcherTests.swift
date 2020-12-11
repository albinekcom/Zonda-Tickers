import XCTest
@testable import BitBay_TickerCore

final class TickerFetcherTests: XCTestCase {

    func testReturningFetchingValuesDataError() throws {
        let tickerFetcher = TickerFetcher(valuesDataRepository: MockTickerValuesDataReturningNil(), statsDataRepository: MockTickerStatsDataReturningData())
        
        let result = tickerFetcher.fetchTicker(tickerIdentifier: "BTC-PLN")
        
        XCTAssertEqual(.failure(TickerFetcherError.fetchingValuesData), result)
    }
    
    func testReturningFetchingStatsDataError() throws {
        let tickerFetcher = TickerFetcher(valuesDataRepository: MockTickerValuesDataReturningData(), statsDataRepository: MockTickerStatsDataReturningNil())
        
        let result = tickerFetcher.fetchTicker(tickerIdentifier: "BTC-PLN")
        
        XCTAssertEqual(.failure(TickerFetcherError.fetchingStatsData), result)
    }
    
    func testReturningSuccess() throws {
        let tickerFetcher = TickerFetcher(valuesDataRepository: MockTickerValuesDataReturningData(), statsDataRepository: MockTickerStatsDataReturningData())
        
        let result = tickerFetcher.fetchTicker(tickerIdentifier: "BTC-PLN")
        
        XCTAssertEqual(.success(Ticker(id: "BTC-PLN", highestBid: 1, lowestAsk: 2, rate: 3, previousRate: 4, highestRate: 5, lowestRate: 6, volume: 7, average: 8)), result)
    }

}

// MARK: - Helpers

private struct MockTickerValuesDataReturningNil: TickerValuesDataRepositoryPort {

    func fetchTickerValuesData(tickerIdentifier: String) -> TickerValuesData? { nil }

}

private struct MockTickerValuesDataReturningData: TickerValuesDataRepositoryPort {

    func fetchTickerValuesData(tickerIdentifier: String) -> TickerValuesData? { TickerValuesData(highestBid: 1, lowestAsk: 2, rate: 3, previousRate: 4) }

}

private struct MockTickerStatsDataReturningNil: TickerStatsDataRepositoryPort {

    func fetchTickerStatsData(tickerIdentifier: String) -> TickerStatsData? { nil }

}

private struct MockTickerStatsDataReturningData: TickerStatsDataRepositoryPort {

    func fetchTickerStatsData(tickerIdentifier: String) -> TickerStatsData? { TickerStatsData(highestRate: 5, lowestRate: 6, volume: 7, average: 8) }

}
