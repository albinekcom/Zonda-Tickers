public struct TickerAPIFetcher {

    private let tickerValuesAPIDataRepository: TickerValuesAPIDataRepositoryPort
    private let tickerStatsAPIDataRepository: TickerStatsAPIDataRepositoryPort

    public init(tickerValuesAPIDataRepository: TickerValuesAPIDataRepositoryPort = TickerValuesAPIDataRepository(), tickerStatsAPIDataRepository: TickerStatsAPIDataRepositoryPort = TickerStatsAPIDataRepository()) {
        self.tickerValuesAPIDataRepository = tickerValuesAPIDataRepository
        self.tickerStatsAPIDataRepository = tickerStatsAPIDataRepository
    }

}

extension TickerAPIFetcher: TickerFetcherPort {

    public func fetchTicker(tickerIdentifier: String, shouldFetchValues: Bool, shouldFetchStats: Bool) -> Result<Ticker, TickerFetcherError> {
        let tickerValuesAPIDataResult = fetchTickerAPIValuesData(tickerIdentifier: tickerIdentifier, shouldFetchValues: shouldFetchValues)
        let tickerStatsAPIDataResult = fetchTickerAPIStatsData(tickerIdentifier: tickerIdentifier, shouldFetchStats: shouldFetchStats)
        
        let tickerValuesAPIDataResponse: TickerValuesAPIDataResponse
        switch tickerValuesAPIDataResult {
        case .success(let valuesAPIData):
            tickerValuesAPIDataResponse = valuesAPIData
        case .failure(let error):
            return .failure(error)
        }
        
        let tickerStatsAPIDataResponse: TickerStatsAPIDataResponse
        switch tickerStatsAPIDataResult {
        case .success(let statsAPIData):
            tickerStatsAPIDataResponse = statsAPIData
        case .failure(let error):
            return .failure(error)
        }
        
        let ticker = TickerFactory().makeTicker(tickerIdenfitier: tickerIdentifier, tickerValuesAPIData: tickerValuesAPIDataResponse, tickerStatsAPIData: tickerStatsAPIDataResponse)

        return .success(ticker)
    }
    
    private func fetchTickerAPIValuesData(tickerIdentifier: String, shouldFetchValues: Bool) -> Result<TickerValuesAPIDataResponse, TickerFetcherError> {
        guard shouldFetchValues else {
            return .success(TickerValuesAPIDataResponse(status: nil, ticker: nil))
        }
        
        guard let tickerValuesData = tickerValuesAPIDataRepository.fetchTickerValuesAPIData(tickerIdentifier: tickerIdentifier) else {
            return .failure(TickerFetcherError.fetchingValuesData)
        }
        
        return .success(tickerValuesData)
    }
    
    private func fetchTickerAPIStatsData(tickerIdentifier: String, shouldFetchStats: Bool) -> Result<TickerStatsAPIDataResponse, TickerFetcherError> {
        guard shouldFetchStats else {
            return .success(TickerStatsAPIDataResponse(status: nil, stats: nil))
        }
        
        guard let tickerStatsData = tickerStatsAPIDataRepository.fetchTickerStatsAPIData(tickerIdentifier: tickerIdentifier) else {
            return .failure(TickerFetcherError.fetchingStatsData)
        }
        
        return .success(tickerStatsData)
    }

}

public enum TickerFetcherError: Error {

    case fetchingValuesData
    case fetchingStatsData

}

public protocol TickerFetcherPort {

    func fetchTicker(tickerIdentifier: String, shouldFetchValues: Bool, shouldFetchStats: Bool) -> Result<Ticker, TickerFetcherError>

}
