import XCTest
@testable import BitBay_TickerCore

final class NetworkingServiceTests: XCTestCase {
    
    private let url = URL(string: "https://example.test")!
    
    func testFetchingSomeData() throws {
        let fetchingResult = NetworkingService(session: MockURLSessionWithSomeData()).fetchData(url: url)

        XCTAssertNotNil(fetchingResult)
    }
    
    func testFetchingNilData() throws {
        let fetchingResult = NetworkingService(session: MockURLSessionWithNilData()).fetchData(url: url)
        
        XCTAssertNil(fetchingResult)
    }
    
}

// MARK: - Helpers

final class MockURLSessionWithNilData: URLSession {
    
    final class MockURLSessionDataTaskWitNilData: URLSessionDataTask {

        private let completion: (Data?, URLResponse?, Error?) -> Void

        init(completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
            self.completion = completion
        }

        override func resume() {
            completion(nil, nil, nil)
        }
    }
    
    init(configuration: URLSessionConfiguration = .default) {}
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        MockURLSessionDataTaskWitNilData(completion: completionHandler)
    }
    
}

final class MockURLSessionWithSomeData: URLSession {
    
    final class MockURLSessionDataTaskWithSomeData: URLSessionDataTask {

        private let completion: (Data?, URLResponse?, Error?) -> Void

        init(completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
            self.completion = completion
        }

        override func resume() {
            let jsonTestDataString = """
                {"status":"THIS IS SOME TEST DATA"}
            """
            
            let someData = jsonTestDataString.data(using: .utf8)
            
            completion(someData, nil, nil)
        }
    }


    
    init(configuration: URLSessionConfiguration = .default) {}
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        MockURLSessionDataTaskWithSomeData(completion: completionHandler)
    }
    
}
