import BitBay_TickerCore
import Foundation

public struct MainOutcome {
    
    public let text: String
    public let exitCode: Int32
    
}

struct MainOutcomeFactory {
    
    func makeOutcome(fromApplicationResult applicationResult: Result<String, ApplicationError>) -> MainOutcome {
        let text: String
        let exitCode: Int32

        switch applicationResult {
            case .success(let outputString):
                text = outputString
                exitCode = 0

            case .failure(let error):
                switch error {
                case .fetchingStatisticsIssue:
                    text = "Error: cannot fetch ticker statistics"
                case .wrongTickerIdentifier:
                    text = "Error: wrong ticker identifier"
                case .tickerIdentifierIsNotValid(let tickerIdentifier):
                    text = "Error: ticker identifier \"\(tickerIdentifier)\" is not valid"
                case .fetchingValuesIssue:
                    text = "Error: cannot fetch ticker values"
                }

                exitCode = 1
            }

        return MainOutcome(text: text, exitCode: exitCode)
    }
    
}
