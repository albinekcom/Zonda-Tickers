struct TickersRepository {

    private let remoteTickersRepository: AnyRemoteTickersRepository

    init(remoteTickersRepository: AnyRemoteTickersRepository = RemoteTickersRepository()) {
        self.remoteTickersRepository = remoteTickersRepository
    }

    func loadTickers(tickerIds: [String], shouldLoadValues: Bool, shouldLoadStatistics: Bool) async throws -> [Ticker] {
        async let tickersValues = remoteTickersRepository.fetchTickersValues(shouldFetch: shouldLoadValues)
        async let tickersStatistics = remoteTickersRepository.fetchTickersStatistics(shouldFetch: shouldLoadStatistics)
        
        let fetchedTickersValues = try? await tickersValues
        let fetchedTickersStatistics = try? await tickersStatistics
        
        return tickerIds.map {
            Ticker(id: $0,
                   apiTickerValuesItem: fetchedTickersValues?.items[$0.uppercased()],
                   apiTickerStatisticsItem: fetchedTickersStatistics?.items[$0.uppercased()])
        }
    }

}
