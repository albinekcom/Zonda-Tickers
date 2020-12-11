struct ApplicationResultOutput {
    
    let outputString: String
    let exitType: ExitType
    
}

struct ApplicationResultOutputFactory {
    
    func makeApplicationResultOutput(from applicationResult: Result<String, ApplicationError>) -> ApplicationResultOutput {
        let outputString: String
        let exitType: ExitType
        
        switch applicationResult {
            case .success(let resultOutputString):
                outputString = resultOutputString
                exitType = .success
            
            case .failure(let error):
                switch error {
                case .fetchingStatisticsIssue:
                    outputString = "Error: wrong ticker identifier"
                case .wrongTickerIdentifier:
                    outputString = "Error: ticker identifier is not valid"
                case .tickerIdentifierIsNotValid:
                    outputString = "Error: ticker identifier is not valid"
                case .fetchingValuesIssue:
                    outputString = "Error: cannot fetch ticker values"
                case .tickerIdentifierIsNotSupported:
                    outputString = "Error: cannot fetch ticker statistics"
                }
                
                exitType = .fail
            }
        
        return ApplicationResultOutput(outputString: outputString, exitType: exitType)
    }
    
}
