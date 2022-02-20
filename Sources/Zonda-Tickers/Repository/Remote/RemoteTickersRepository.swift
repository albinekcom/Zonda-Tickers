import Foundation

final class RemoteTickersRepository {

    private let urlSession: URLSession
    private let jsonDecoder: JSONDecoder

    init(urlSession: URLSession = URLSession.shared, jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.urlSession = urlSession
        self.jsonDecoder = jsonDecoder
    }

    func fetchTickersValues(shouldFetch: Bool) async throws -> TickersValuesAPIResponse? {
        shouldFetch ? try await fetch(from: .ticker) : nil
    }

    func fetchTickersStatistics(shouldFetch: Bool) async throws -> TickersStatisticsAPIResponse? {
        shouldFetch ? try await fetch(from: .stats) : nil
    }

    private func fetch<T: Decodable>(from endpoint: Endpoint) async throws -> T {
        let (data, _) = try await urlSession.data(from: endpoint.url)

        return try jsonDecoder.decode(T.self, from: data)
    }

}
