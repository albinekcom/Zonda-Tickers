struct TickerValuesDataRepository {

    private let apiDataRepository: TickerValuesAPIDataRepositoryPort

    init(apiDataRepository: TickerValuesAPIDataRepositoryPort = TickerValuesAPIDataRepository()) {
        self.apiDataRepository = apiDataRepository
    }

}

extension TickerValuesDataRepository: TickerValuesDataRepositoryPort {

    func fetchTickerValuesData(tickerIdentifier: String) -> TickerValuesData? {
        guard let tickerValuesAPIDataResponse = apiDataRepository.fetchTickerValuesAPIData(tickerIdentifier: tickerIdentifier) else {
            return nil
        }

        return TickerValuesDataFactory().makeTickerValuesData(from: tickerValuesAPIDataResponse)
    }

}

protocol TickerValuesDataRepositoryPort {

    func fetchTickerValuesData(tickerIdentifier: String) -> TickerValuesData?

}
