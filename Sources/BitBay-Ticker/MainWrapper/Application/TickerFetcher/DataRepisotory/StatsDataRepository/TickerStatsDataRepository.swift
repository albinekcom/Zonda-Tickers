struct TickerStatsDataRepository {

    private let apiDataRepository: TickerStatsAPIDataRepositoryPort

    init(apiDataRepository: TickerStatsAPIDataRepositoryPort = TickerStatsAPIDataRepository()) {
        self.apiDataRepository = apiDataRepository
    }

}

extension TickerStatsDataRepository: TickerStatsDataRepositoryPort {

    func fetchTickerStatsData(tickerIdentifier: String) -> TickerStatsData? {
        guard let tickerStatsAPIDataResponse = apiDataRepository.fetchTickerStatsAPIData(tickerIdentifier: tickerIdentifier) else {
            return nil
        }

        return TickerStatsDataFactory().makeTickerStatsData(from: tickerStatsAPIDataResponse)
    }

}

protocol TickerStatsDataRepositoryPort {

    func fetchTickerStatsData(tickerIdentifier: String) -> TickerStatsData?

}
