import XCTest
@testable import Zonda_Tickers

final class RepositoryTests: XCTestCase {
    
    func test_loadTickers() async throws {
        let urlSessionDataStub = URLSessionDataStub()
        
        let tickers = try await Repository(urlSessionData: urlSessionDataStub).loadTickers()
        
        XCTAssertEqual(
            2,
            tickers.count
        )
        
        XCTAssertTrue(tickers.contains(where: { $0.id == "btc-pln" }))
        XCTAssertTrue(tickers.contains(where: { $0.id == "eth-pln" }))
    }
    
}

private struct URLSessionDataStub: URLSessionData {
    
    func data(
        from url: URL,
        delegate: URLSessionTaskDelegate?
    ) async throws -> (Data, URLResponse) {
        let jsonString: String
        
        if url == URL(string: "https://api.zonda.exchange/rest/trading/ticker")! {
            jsonString = tickersValuesAPIResponseJSONStringStub
        } else {
            jsonString = tickersStatisticsAPIResponseJSONStringStub
        }
        
        return (
            jsonString.data(using: .utf8)!,
            URLResponse()
        )
    }
    
    private var tickersValuesAPIResponseJSONStringStub: String {
        """
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
                },
                "ETH-PLN": {
                    "market": {
                        "code": "ETH-PLN",
                        "first": {
                            "currency": "ETH",
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
    }
    
    private var tickersStatisticsAPIResponseJSONStringStub: String {
        """
        {
            "status": "Ok",
            "items": {
                "ETH-PLN": {
                    "m": "ETH-PLN"
                },
                "LSK-USD": {
                    "m": "LSK-USD"
                },
                "BTC-PLN": {
                    "m": "BTC-PLN"
                }
            }
        }
        """
    }
    
}
