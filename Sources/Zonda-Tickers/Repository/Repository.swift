import Foundation

protocol TickersRepository {
    
    func loadTickers() async throws -> [Ticker]

}

struct Repository: TickersRepository {
    
    private let urlSessionData: URLSessionData
    
    init() {
        self.init(urlSessionData: URLSession.shared)
    }
    
    init(urlSessionData: URLSessionData) {
        self.urlSessionData = urlSessionData
    }
    
    func loadTickers() async throws -> [Ticker] {
        async let fetchedTickersValuesAPIResponse = fetch(
            TickersValuesAPIResponse.self,
            from: .ticker
        )
        
        async let fetchedTickersStatisticsAPIResponse = fetch(
            TickersStatisticsAPIResponse.self,
            from: .stats
        )
        
        let (tickersValuesAPIResponse, tickersStatisticsAPIResponse) = try await (fetchedTickersValuesAPIResponse, fetchedTickersStatisticsAPIResponse)
        
        return tickersValuesAPIResponse.items
            .compactMap {
                .init(
                    valuesAPIResponse: $1,
                    statisticsAPIResponse: tickersStatisticsAPIResponse.items[$0]
                )
            }
    }
    
    private func fetch<T: Decodable>(
        _ type: T.Type,
        from endpoint: Endpoint
    ) async throws -> T {
        try JSONDecoder().decode(
            T.self,
            from: try await urlSessionData.data(from: endpoint.url, delegate: nil).0
        )
    }
    
}

private enum Endpoint: String {
    
    case ticker
    case stats
    
    var url: URL {
        .init(string: "https://api.zonda.exchange/rest/trading/\(rawValue)")!
    }
    
}

private extension Ticker {
    
    init?(
        valuesAPIResponse: TickersValuesAPIResponse.Item?,
        statisticsAPIResponse: TickersStatisticsAPIResponse.Item?
    ) {
        guard let valuesAPIResponse = valuesAPIResponse else { return nil }
        
        self.init(
            id: valuesAPIResponse.market.code.lowercased(),
            secondCurrencyId: valuesAPIResponse.market.second.currency.lowercased(),
            secondCurrencyFractionDigitsCount: valuesAPIResponse.market.second.scale,
            average: statisticsAPIResponse?.r24h?.double,
            highestBid: valuesAPIResponse.highestBid?.double,
            highestRate: statisticsAPIResponse?.h?.double,
            lowestAsk: valuesAPIResponse.lowestAsk?.double,
            lowestRate: statisticsAPIResponse?.l?.double,
            previousRate: valuesAPIResponse.previousRate?.double,
            rate: valuesAPIResponse.rate?.double,
            volume: statisticsAPIResponse?.v?.double
        )
    }
    
}

private extension String {
    
    var double: Double? { Double(self) }
    
}

protocol URLSessionData {
    
    func data(from url: URL, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
    
}

extension URLSession: URLSessionData {}
