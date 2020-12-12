import BitBay_TickerCore
import Foundation

public struct MainOutcome {
    
    public enum ExitType: Int32 {
        case success = 0
        case fail = -1
    }
    
    public let text: String
    public let exitType: ExitType
    
}

struct MainOutcomeFactory {
    
    func makeOutcome(fromApplicationResult applicationResult: Result<String, ApplicationError>) -> MainOutcome {
        let text: String
        let exitType: MainOutcome.ExitType

        switch applicationResult {
            case .success(let outputString):
                text = outputString
                exitType = .success

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

                exitType = .fail
            }

        return MainOutcome(text: text, exitType: exitType)
    }
    
}
