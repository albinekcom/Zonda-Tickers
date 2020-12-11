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
        
        XCTAssertEqual(.failure(ApplicationError.tickerIdentifierIsNotValid), result)   
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

struct MockValidtorAlwaysValid: TickerIdentifierValidatorPort {

    func isValid(tickerIdentifier: String) -> Bool { true }

}

struct MockValidtorNeverValid: TickerIdentifierValidatorPort {

    func isValid(tickerIdentifier: String) -> Bool { false }

}

struct MockTickerOutputStringFactory : TickerOutputStringFactoryPort {

    func makePrintableString(ticker: Ticker, printArguments: [PrintArgument]) -> String { "TEST TICKER OUTPUT STRING" }

}

struct MockTickerFetcherReturningFetchingStatsDataError: TickerFetcherPort {

    func fetchTicker(tickerIdentifier: String) -> Result<Ticker, TickerFetcherError> { .failure(TickerFetcherError.fetchingStatsData) }

}

struct MockTickerFetcherReturningFetchingValuesDataError: TickerFetcherPort {

    func fetchTicker(tickerIdentifier: String) -> Result<Ticker, TickerFetcherError> { .failure(TickerFetcherError.fetchingValuesData) }

}

struct MockTickerFetcherReturningSuccess: TickerFetcherPort {

    func fetchTicker(tickerIdentifier: String) -> Result<Ticker, TickerFetcherError> { .success(Ticker(id: "BTC-PLN", highestBid: 1, lowestAsk: nil, rate: nil, previousRate: nil, highestRate: nil, lowestRate: nil, volume: nil, average: nil)) }

}
