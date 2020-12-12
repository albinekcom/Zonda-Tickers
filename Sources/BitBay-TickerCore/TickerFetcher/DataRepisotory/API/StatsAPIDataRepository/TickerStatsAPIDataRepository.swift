import Foundation

public struct TickerStatsAPIDataRepository {

    private let endpointFactory: EndpointFactoryPort
    private let networkingService: NetworkingServicePort

    public init(endpointFactory: EndpointFactoryPort = EndpointFactory(), networkingService: NetworkingServicePort = NetworkingService()) {
        self.endpointFactory = endpointFactory
        self.networkingService = networkingService
    }
}

extension TickerStatsAPIDataRepository: TickerStatsAPIDataRepositoryPort {

    public func fetchTickerStatsAPIData(tickerIdentifier: String) -> TickerStatsAPIDataResponse? {
        guard let url = endpointFactory.makeStatsURL(for: tickerIdentifier) else {
            return nil
        }

        guard let jsonData = networkingService.fetchData(url: url) else {
            return nil
        }
        
        if let tickerPropertiesAPIErrorResponse = try? JSONDecoder().decode(TickerPropertiesAPIErrorResponse.self, from: jsonData), tickerPropertiesAPIErrorResponse.isFail {
            return nil
        }

        return try? JSONDecoder().decode(TickerStatsAPIDataResponse.self, from: jsonData)
    }

}

public protocol TickerStatsAPIDataRepositoryPort {

    func fetchTickerStatsAPIData(tickerIdentifier: String) -> TickerStatsAPIDataResponse?

}
