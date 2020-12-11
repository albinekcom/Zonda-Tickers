public struct TickerValuesDataRepository {

    private let apiDataRepository: TickerValuesAPIDataRepositoryPort

    public init(apiDataRepository: TickerValuesAPIDataRepositoryPort = TickerValuesAPIDataRepository()) {
        self.apiDataRepository = apiDataRepository
    }

}

extension TickerValuesDataRepository: TickerValuesDataRepositoryPort {

    public func fetchTickerValuesData(tickerIdentifier: String) -> TickerValuesData? {
        guard let tickerValuesAPIDataResponse = apiDataRepository.fetchTickerValuesAPIData(tickerIdentifier: tickerIdentifier) else {
            return nil
        }

        return TickerValuesDataFactory().makeTickerValuesData(from: tickerValuesAPIDataResponse)
    }

}

public protocol TickerValuesDataRepositoryPort {

    func fetchTickerValuesData(tickerIdentifier: String) -> TickerValuesData?

}
