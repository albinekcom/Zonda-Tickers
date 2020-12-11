import Foundation

public struct TickerValuesAPIDataRepository {

    private let networkingService: NetworkingServicePort

    public init(networkingService: NetworkingServicePort = NetworkingService()) {
        self.networkingService = networkingService
    }
}

extension TickerValuesAPIDataRepository: TickerValuesAPIDataRepositoryPort {

    public func fetchTickerValuesAPIData(tickerIdentifier: String) -> TickerValuesAPIDataResponse? {
        guard let url = EndpointFactory().makeValuesURL(for: tickerIdentifier) else {
            return nil
        }

        guard let jsonData = networkingService.fetchData(url: url) else {
            return nil
        }

        return try? JSONDecoder().decode(TickerValuesAPIDataResponse.self, from: jsonData)
    }

}

public protocol TickerValuesAPIDataRepositoryPort {

    func fetchTickerValuesAPIData(tickerIdentifier: String) -> TickerValuesAPIDataResponse?

}
