public enum TickerFetcherError: Error {

    case fetchingValuesData
    case fetchingStatsData

}

public struct TickerFetcher {

    private let valuesDataRepository: TickerValuesDataRepositoryPort
    private let statsDataRepository: TickerStatsDataRepositoryPort

    public init(valuesDataRepository: TickerValuesDataRepositoryPort = TickerValuesDataRepository(), statsDataRepository: TickerStatsDataRepositoryPort = TickerStatsDataRepository()) {
        self.valuesDataRepository = valuesDataRepository
        self.statsDataRepository = statsDataRepository
    }

}

extension TickerFetcher: TickerFetcherPort {

    public func fetchTicker(tickerIdentifier: String) -> Result<Ticker, TickerFetcherError> {
        guard let tickerValuesData = valuesDataRepository.fetchTickerValuesData(tickerIdentifier: tickerIdentifier) else {
            return .failure(TickerFetcherError.fetchingValuesData)
        }

        guard let tickerStatsData = statsDataRepository.fetchTickerStatsData(tickerIdentifier: tickerIdentifier) else {
            return .failure(TickerFetcherError.fetchingStatsData)
        }

        let ticker = TickerFactory().makeTicker(tickerIdenfitier: tickerIdentifier, tickerValuesData: tickerValuesData, tickerStatsData: tickerStatsData)

        return .success(ticker)
    }

}

public protocol TickerFetcherPort {

    func fetchTicker(tickerIdentifier: String) -> Result<Ticker, TickerFetcherError>

}
