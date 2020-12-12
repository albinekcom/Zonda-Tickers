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

    public func fetchTicker(tickerIdentifier: String, shouldFetchValues: Bool, shouldFetchStats: Bool) -> Result<Ticker, TickerFetcherError> {
        let tickerValuesDataResult = fetchTickerValuesData(tickerIdentifier: tickerIdentifier, shouldFetchValues: shouldFetchValues)
        let tickerStatsDataResult = fetchTickerStatsData(tickerIdentifier: tickerIdentifier, shouldFetchStats: shouldFetchStats)
        
        let tickerValuesData: TickerValuesData
        switch tickerValuesDataResult {
        case .success(let valuesData):
            tickerValuesData = valuesData
        case .failure(let error):
            return .failure(error)
        }
        
        let tickerStatsData: TickerStatsData
        switch tickerStatsDataResult {
        case .success(let statsData):
            tickerStatsData = statsData
        case .failure(let error):
            return .failure(error)
        }
        
        let ticker = TickerFactory().makeTicker(tickerIdenfitier: tickerIdentifier, tickerValuesData: tickerValuesData, tickerStatsData: tickerStatsData)

        return .success(ticker)
    }
    
    private func fetchTickerValuesData(tickerIdentifier: String, shouldFetchValues: Bool) -> Result<TickerValuesData, TickerFetcherError> {
        guard shouldFetchValues else {
            return .success(TickerValuesData(highestBid: nil, lowestAsk: nil, rate: nil, previousRate: nil))
        }
        
        guard let tickerValuesData = valuesDataRepository.fetchTickerValuesData(tickerIdentifier: tickerIdentifier) else {
            return .failure(TickerFetcherError.fetchingValuesData)
        }
        
        return .success(tickerValuesData)
    }
    
    private func fetchTickerStatsData(tickerIdentifier: String, shouldFetchStats: Bool) -> Result<TickerStatsData, TickerFetcherError> {
        guard shouldFetchStats else {
            return .success(TickerStatsData(highestRate: nil, lowestRate: nil, volume: nil, average: nil))
        }
        
        guard let tickerStatsData = statsDataRepository.fetchTickerStatsData(tickerIdentifier: tickerIdentifier) else {
            return .failure(TickerFetcherError.fetchingStatsData)
        }
        
        return .success(tickerStatsData)
    }

}

public protocol TickerFetcherPort {

    func fetchTicker(tickerIdentifier: String, shouldFetchValues: Bool, shouldFetchStats: Bool) -> Result<Ticker, TickerFetcherError>

}
