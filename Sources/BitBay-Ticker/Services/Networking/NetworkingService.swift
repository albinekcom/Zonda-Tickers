import Foundation

struct NetworkingService {}

extension NetworkingService: NetworkingServicePort {

    func fetchData(url: URL) -> Data? {
        try? Data(contentsOf: url)
    }

}
