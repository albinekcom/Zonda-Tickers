import Foundation

public struct TickerStatsAPIDataRepository {

    private let networkingService: NetworkingServicePort

    public init(networkingService: NetworkingServicePort = NetworkingService()) {
        self.networkingService = networkingService
    }
}

extension TickerStatsAPIDataRepository: TickerStatsAPIDataRepositoryPort {

    public func fetchTickerStatsAPIData(tickerIdentifier: String) -> TickerStatsAPIDataResponse? {
        guard let url = EndpointFactory().makeStatsURL(for: tickerIdentifier) else {
            return nil
        }

        guard let jsonData = networkingService.fetchData(url: url) else {
            return nil
        }

        return try? JSONDecoder().decode(TickerStatsAPIDataResponse.self, from: jsonData)
    }

}

public protocol TickerStatsAPIDataRepositoryPort {

    func fetchTickerStatsAPIData(tickerIdentifier: String) -> TickerStatsAPIDataResponse?

}
