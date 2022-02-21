import XCTest
@testable import Zonda_Tickers

final class RemoteTickersRepositoryTests: XCTestCase {
    
    private let urlSessionDataStub = URLSessionDataStub()
    private var sut: RemoteTickersRepository!
    
    override func setUp() {
        super.setUp()
        
        sut = RemoteTickersRepository(urlSessionData: urlSessionDataStub)
    }
    
    // MARK: - Tests
    
    func test_fetchTickersValues_withShouldFetchFalse() async throws {
        let fetchedTickersValues = try await sut.fetchTickersValues(shouldFetch: false)
        
        XCTAssertNil(fetchedTickersValues)
    }
    
    func test_fetchTickersValues_withShouldFetchTrue() async throws {
        let jsonString = """
        {
            "status": "Ok",
            "items": {
                "BTC-PLN": {
                    "market": {
                        "code": "BTC-PLN",
                        "first": {
                            "currency": "BTC",
                            "scale": 8
                        },
                        "second": {
                            "currency": "PLN",
                            "scale": 2
                        }
                    }
                }
            }
        }
        """
        
        urlSessionDataStub.returnedData = jsonString.data(using: .utf8)!
        
        let fetchedTickersValues = try await sut.fetchTickersValues(shouldFetch: true)
        
        XCTAssertEqual("Ok", fetchedTickersValues!.status)
        XCTAssertEqual(1, fetchedTickersValues!.items.count)
    }
    
    func test_fetchTickersStatistics_withShouldFetchFalse() async throws {
        let fetchedTickersStatistics = try await sut.fetchTickersStatistics(shouldFetch: false)
        
        XCTAssertNil(fetchedTickersStatistics)
    }
    
    func test_fetchTickersStatistics_withShouldFetchTrue() async throws {
        let jsonString = """
        {
            "status": "Ok",
            "items": {
                "BTC-PLN": {
                    "m": "BTC-PLN"
                },
                "ETH-PLN": {
                    "m": "ETH-PLN"
                }
            }
        }
        """
        
        urlSessionDataStub.returnedData = jsonString.data(using: .utf8)!
        
        let fetchedTickersStatistics = try await sut.fetchTickersStatistics(shouldFetch: true)
        
        XCTAssertEqual("Ok", fetchedTickersStatistics!.status)
        XCTAssertEqual(2, fetchedTickersStatistics!.items.count)
    }
    
}

// MARK: - Helpers

private final class URLSessionDataStub: URLSessionData {
    
    var returnedData = Data()
    
    func data(from url: URL, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        (returnedData, URLResponse())
    }
    
}
