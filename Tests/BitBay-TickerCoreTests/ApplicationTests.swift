import XCTest
@testable import BitBay_TickerCore

final class ApplicationTests: XCTestCase {

    func testReturningErrorWrongTickerIdentifier() throws {
        let application = Application(tickerIdentifierValidator: MockValidtorAlwaysValid(), tickerFetcher: MockTickerFetcherReturningSuccess(), tickerOutputStringFactory: MockTickerOutputStringFactory())
        
        let result = application.makeApplicationResult(userStringArguments: ["ApplicationName"])
        
        XCTAssertEqual(.failure(ApplicationError.wrongTickerIdentifier), result)
    }
    
    func testReturningErrorTickerIdentifierIsNotValid() throws {
        let application = Application(tickerIdentifierValidator: MockValidtorNeverValid(), tickerFetcher: MockTickerFetcherReturningSuccess(), tickerOutputStringFactory: MockTickerOutputStringFactory())
        
        let result = application.makeApplicationResult(userStringArguments: ["ApplicationName", "BTC-PLN"])
        
        XCTAssertEqual(.failure(ApplicationError.tickerIdentifierIsNotValid(tickerIdentifier: "BTC-PLN")), result)   
    }
    
    func testReturningtErrorFetchingValuesIssue() throws {
        let application = Application(tickerIdentifierValidator: MockValidtorAlwaysValid(), tickerFetcher: MockTickerFetcherReturningFetchingValuesDataError(), tickerOutputStringFactory: MockTickerOutputStringFactory())
        
        let result = application.makeApplicationResult(userStringArguments: ["ApplicationName", "BTC-PLN"])
        
        XCTAssertEqual(.failure(ApplicationError.fetchingValuesIssue), result)
    }
    
    func testReturningtErrorFetchingStatisticsIssue() throws {
        let application = Application(tickerIdentifierValidator: MockValidtorAlwaysValid(), tickerFetcher: MockTickerFetcherReturningFetchingStatsDataError(), tickerOutputStringFactory: MockTickerOutputStringFactory())
        
        let result = application.makeApplicationResult(userStringArguments: ["ApplicationName", "BTC-PLN"])
        
        XCTAssertEqual(.failure(ApplicationError.fetchingStatisticsIssue), result)
    }
    
    func testtReturningSuccess() throws {
        let application = Application(tickerIdentifierValidator: MockValidtorAlwaysValid(), tickerFetcher: MockTickerFetcherReturningSuccess(), tickerOutputStringFactory: MockTickerOutputStringFactory())
        
        let result = application.makeApplicationResult(userStringArguments: ["ApplicationName", "BTC-PLN"])
        
        XCTAssertEqual(.success("TEST TICKER OUTPUT STRING"), result)
    }

}

// MARK: - Helpers

private struct MockValidtorAlwaysValid: TickerIdentifierValidatorPort {

    func isValid(tickerIdentifier: String) -> Bool { true }

}

private struct MockValidtorNeverValid: TickerIdentifierValidatorPort {

    func isValid(tickerIdentifier: String) -> Bool { false }

}

private struct MockTickerOutputStringFactory : TickerOutputStringFactoryPort {

    func makePrintableString(ticker: Ticker, printArguments: [PrintArgument]) -> String { "TEST TICKER OUTPUT STRING" }

}

private struct MockTickerFetcherReturningFetchingStatsDataError: TickerFetcherPort {
    
    func fetchTicker(tickerIdentifier: String, shouldFetchValues: Bool, shouldFetchStats: Bool) -> Result<Ticker, TickerFetcherError> {
        .failure(TickerFetcherError.fetchingStatsData)
    }

}

private struct MockTickerFetcherReturningFetchingValuesDataError: TickerFetcherPort {
    
    func fetchTicker(tickerIdentifier: String, shouldFetchValues: Bool, shouldFetchStats: Bool) -> Result<Ticker, TickerFetcherError> {
        .failure(TickerFetcherError.fetchingValuesData)
    }
    
}

private struct MockTickerFetcherReturningSuccess: TickerFetcherPort {
    
    func fetchTicker(tickerIdentifier: String, shouldFetchValues: Bool, shouldFetchStats: Bool) -> Result<Ticker, TickerFetcherError> {
        .success(Ticker(id: "BTC-PLN", highestBid: 1, lowestAsk: nil, rate: nil, previousRate: nil, highestRate: nil, lowestRate: nil, volume: nil, average: nil))
    }
    
}
