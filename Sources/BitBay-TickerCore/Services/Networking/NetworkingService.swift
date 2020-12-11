import Foundation

public struct NetworkingService {

    public init() {}

}

extension NetworkingService: NetworkingServicePort {

    public func fetchData(url: URL) -> Data? {
        try? Data(contentsOf: url)
    }

}
