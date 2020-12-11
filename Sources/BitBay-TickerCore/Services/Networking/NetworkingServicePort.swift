import Foundation

public protocol NetworkingServicePort {

    func fetchData(url: URL) -> Data?

}
