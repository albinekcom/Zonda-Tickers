struct TickersRepository {

    private let remoteTickersRepository: RemoteTickersRepository

    init(remoteTickersRepository: RemoteTickersRepository = RemoteTickersRepository()) {
        self.remoteTickersRepository = remoteTickersRepository
    }

    func loadTickers(tickerIds: [String], shouldLoadValues: Bool, shouldLoadStatistics: Bool) async throws -> [Ticker] {
        async let tickersValues = try remoteTickersRepository.fetchTickersValues(shouldFetch: shouldLoadValues)
        async let tickersStatistics = try remoteTickersRepository.fetchTickersStatistics(shouldFetch: shouldLoadStatistics)
        
        let fetchedTickersValues = try? await tickersValues
        let fetchedTickersStatistics = try? await tickersStatistics
        
        return tickerIds.map {
            let apiTickerId = $0.uppercased()
            
            let apiTickerValuesItem = fetchedTickersValues?.items[apiTickerId]
            let apiTickerStatisticsItem = fetchedTickersStatistics?.items[apiTickerId]
            
            return Ticker(id: $0,
                          apiTickerValuesItem: apiTickerValuesItem,
                          apiTickerStatisticsItem: apiTickerStatisticsItem)
        }
    }

}
