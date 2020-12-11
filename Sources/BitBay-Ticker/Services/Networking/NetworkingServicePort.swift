import Foundation

protocol NetworkingServicePort {

    func fetchData(url: URL) -> Data?

}
