import XCTest
@testable import BitBay_TickerCore
@testable import BitBay_TickerMainHelpers

final class MainWrapperTests: XCTestCase {
    
    func testMainOutcomeForApplicationSuccess() {
        struct MockApplication: ApplicationPort {
            func makeApplicationResult(userStringArguments: [String]) -> Result<String, ApplicationError> {
                .success("SUCCESS TEST TEXT")
            }
        }
        
        let mainWrapper = MainWrapper(application: MockApplication())
        
        let outcome = mainWrapper.makeMainOutcome(userStringArguments: [])
        
        XCTAssertEqual("SUCCESS TEST TEXT", outcome.text)
        XCTAssertEqual(0, outcome.exitCode)
        
    }
    
    func testMainOutcomeForApplicationFailureWrongTickerIdentifier() {
        struct MockApplication: ApplicationPort {
            func makeApplicationResult(userStringArguments: [String]) -> Result<String, ApplicationError> {
                .failure(ApplicationError.wrongTickerIdentifier)
            }
        }
        
        let mainWrapper = MainWrapper(application: MockApplication())
        
        let outcome = mainWrapper.makeMainOutcome(userStringArguments: [])
        
        XCTAssertEqual("Error: wrong ticker identifier", outcome.text)
        XCTAssertEqual(1, outcome.exitCode)
        
    }
    
    func testMainOutcomeForApplicationFailureTickerIdentifierIsNotValid() {
        struct MockApplication: ApplicationPort {
            func makeApplicationResult(userStringArguments: [String]) -> Result<String, ApplicationError> {
                .failure(ApplicationError.tickerIdentifierIsNotValid(tickerIdentifier: "BTC-PLN"))
            }
        }
        
        let mainWrapper = MainWrapper(application: MockApplication())
        
        let outcome = mainWrapper.makeMainOutcome(userStringArguments: [])
        
        XCTAssertEqual("Error: ticker identifier \"BTC-PLN\" is not valid", outcome.text)
        XCTAssertEqual(1, outcome.exitCode)
        
    }
    
    
    func testMainOutcomeForApplicationFailureFetchingValuesIssue() {
        struct MockApplication: ApplicationPort {
            func makeApplicationResult(userStringArguments: [String]) -> Result<String, ApplicationError> {
                .failure(ApplicationError.fetchingValuesIssue)
            }
        }
        
        let mainWrapper = MainWrapper(application: MockApplication())
        
        let outcome = mainWrapper.makeMainOutcome(userStringArguments: [])
        
        XCTAssertEqual("Error: cannot fetch ticker values", outcome.text)
        XCTAssertEqual(1, outcome.exitCode)
        
    }
    
    
    func testMainOutcomeForApplicationFailureFetchingStatisticsIssue() {
        struct MockApplication: ApplicationPort {
            func makeApplicationResult(userStringArguments: [String]) -> Result<String, ApplicationError> {
                .failure(ApplicationError.fetchingStatisticsIssue)
            }
        }
        
        let mainWrapper = MainWrapper(application: MockApplication())
        
        let outcome = mainWrapper.makeMainOutcome(userStringArguments: [])
        
        XCTAssertEqual("Error: cannot fetch ticker statistics", outcome.text)
        XCTAssertEqual(1, outcome.exitCode)
        
    }

}
