final class TickersRepository {

    private let remoteTickersRepository: RemoteTickersRepository

    init(remoteTickersRepository: RemoteTickersRepository = RemoteTickersRepository()) {
        self.remoteTickersRepository = remoteTickersRepository
    }

    func loadTickers(tickerIds: [String], shouldLoadValues: Bool, shouldLoadStatistics: Bool) async throws -> [Ticker] {
        async let tickersValues = try remoteTickersRepository.fetchTickersValues(shouldFetch: shouldLoadValues)
        async let tickersStatistics = try remoteTickersRepository.fetchTickersStatistics(shouldFetch: shouldLoadStatistics)

        return await TickersFactory.make(tickerIds: tickerIds,
                                         tickersValuesAPIResponse: try tickersValues,
                                         tickersStatisticsAPIResponse: try tickersStatistics)
    }

}
