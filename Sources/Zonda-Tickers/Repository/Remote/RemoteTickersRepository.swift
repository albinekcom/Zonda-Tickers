import Foundation

struct RemoteTickersRepository {

    private let urlSessionData: URLSessionData

    init(urlSessionData: URLSessionData = URLSession.shared) {
        self.urlSessionData = urlSessionData
    }

    func fetchTickersValues(shouldFetch: Bool) async throws -> TickersValuesAPIResponse? {
        shouldFetch ? try await fetch(from: .ticker) : nil
    }

    func fetchTickersStatistics(shouldFetch: Bool) async throws -> TickersStatisticsAPIResponse? {
        shouldFetch ? try await fetch(from: .stats) : nil
    }

    private func fetch<T: Decodable>(from endpoint: Endpoint) async throws -> T {
        let (data, _) = try await urlSessionData.data(from: endpoint.url, delegate: nil)

        return try JSONDecoder().decode(T.self, from: data)
    }

}

protocol URLSessionData {
    
    func data(from url: URL, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
    
}

extension URLSession: URLSessionData {}
