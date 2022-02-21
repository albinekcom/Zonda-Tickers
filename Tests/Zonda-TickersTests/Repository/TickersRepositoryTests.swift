import XCTest
@testable import Zonda_Tickers

final class TickersRepositoryTests: XCTestCase {
    
    private var sut: TickersRepository!
    
    // MARK: - Tests
    
    func test_loadTickers_withDefaultRemoteRepository_andDiabledLoadingValuesAndLoadingStatistics() async throws {
        sut = TickersRepository()
        
        let results = try await sut.loadTickers(tickerIds: ["BTC-PLN", "ETH-PLN", "LSK-USD"],
                                                shouldLoadValues: false,
                                                shouldLoadStatistics: false)
        
        XCTAssertEqual(3, results.count)
    }
    
    func test_loadTickers_withStubbedRemoteRepository() async throws {
        sut = TickersRepository(remoteTickersRepository: RemoteTickersRepositoryStub())
        
        let results = try await sut.loadTickers(tickerIds: ["BTC-PLN", "ETH-PLN", "LSK-USD"],
                                                shouldLoadValues: true,
                                                shouldLoadStatistics: true)
        
        XCTAssertEqual(3, results.count)
    }
    
}

// MARK: - Helpers

final class RemoteTickersRepositoryStub: AnyRemoteTickersRepository {
    
    func fetchTickersValues(shouldFetch: Bool) async throws -> TickersValuesAPIResponse? { nil }

    func fetchTickersStatistics(shouldFetch: Bool) async throws -> TickersStatisticsAPIResponse? { nil }
    
}
