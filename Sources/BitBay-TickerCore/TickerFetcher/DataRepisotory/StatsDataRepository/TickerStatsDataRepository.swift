public struct TickerStatsDataRepository {

    private let apiDataRepository: TickerStatsAPIDataRepositoryPort

    public init(apiDataRepository: TickerStatsAPIDataRepositoryPort = TickerStatsAPIDataRepository()) {
        self.apiDataRepository = apiDataRepository
    }

}

extension TickerStatsDataRepository: TickerStatsDataRepositoryPort {

    public func fetchTickerStatsData(tickerIdentifier: String) -> TickerStatsData? {
        guard let tickerStatsAPIDataResponse = apiDataRepository.fetchTickerStatsAPIData(tickerIdentifier: tickerIdentifier) else {
            return nil
        }

        return TickerStatsDataFactory().makeTickerStatsData(from: tickerStatsAPIDataResponse)
    }

}

public protocol TickerStatsDataRepositoryPort {

    func fetchTickerStatsData(tickerIdentifier: String) -> TickerStatsData?

}
