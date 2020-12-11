import Foundation

struct TickerValuesAPIDataRepository {

    private let networkingService: NetworkingServicePort

    init(networkingService: NetworkingServicePort = NetworkingService()) {
        self.networkingService = networkingService
    }
}

extension TickerValuesAPIDataRepository: TickerValuesAPIDataRepositoryPort {

    func fetchTickerValuesAPIData(tickerIdentifier: String) -> TickerValuesAPIDataResponse? {
        guard let url = EndpointFactory().makeValuesURL(for: tickerIdentifier) else {
            return nil
        }

        guard let jsonData = networkingService.fetchData(url: url) else {
            return nil
        }

        return try? JSONDecoder().decode(TickerValuesAPIDataResponse.self, from: jsonData)
    }

}

protocol TickerValuesAPIDataRepositoryPort {

    func fetchTickerValuesAPIData(tickerIdentifier: String) -> TickerValuesAPIDataResponse?

}
