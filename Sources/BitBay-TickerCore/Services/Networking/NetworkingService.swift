import Foundation

public struct NetworkingService {

    private let session: URLSession
    
    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }

}

extension NetworkingService: NetworkingServicePort {
    
    public func fetchData(url: URL) -> Data? {
        var fetchedData: Data? = nil
        let semaphore = DispatchSemaphore(value: 0)
        
        session.dataTask(with: url) { (data, response, error) in
            fetchedData = data
            semaphore.signal()
        }.resume()
        
        semaphore.wait()
        
        return fetchedData
    }

}
