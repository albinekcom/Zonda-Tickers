public enum ApplicationError: Error, Equatable {
    case wrongTickerIdentifier
    case tickerIdentifierIsNotValid(tickerIdentifier: String)
    case fetchingValuesIssue
    case fetchingStatisticsIssue
}

public struct Application {
    
    private let tickerIdentifierValidator: TickerIdentifierValidatorPort
    private let tickerFetcher: TickerFetcherPort
    private let tickerOutputStringFactory: TickerOutputStringFactoryPort

    public init(tickerIdentifierValidator: TickerIdentifierValidatorPort = TickerIdentifierValidator(),
                tickerFetcher: TickerFetcherPort = TickerFetcher(),
                tickerOutputStringFactory: TickerOutputStringFactoryPort = TickerOutputStringFactory()) {
        self.tickerIdentifierValidator = tickerIdentifierValidator
        self.tickerFetcher = tickerFetcher
        self.tickerOutputStringFactory = tickerOutputStringFactory
    }
}

extension Application: ApplicationPort {

    public func makeApplicationResult(userStringArguments: [String]) -> Result<String, ApplicationError> {
        let arguments = Arguments(stringArguments: userStringArguments)
        
        guard let tickerIdentifier = arguments.tickerIdentifier else {
            return .failure(ApplicationError.wrongTickerIdentifier)
        }

        guard tickerIdentifierValidator.isValid(tickerIdentifier: tickerIdentifier) else {
            return .failure(ApplicationError.tickerIdentifierIsNotValid(tickerIdentifier: tickerIdentifier))
        }
        
        let shouldFetchPropertiesFactory = ShouldFetchPropertiesFactory(printArguments: arguments.printArguments)
        
        let fetcherResult = tickerFetcher.fetchTicker(tickerIdentifier: tickerIdentifier, shouldFetchValues: shouldFetchPropertiesFactory.shouldFetchValues, shouldFetchStats: shouldFetchPropertiesFactory.shouldFetchStats)

        switch fetcherResult {
            case .success(let ticker):
                let outputString = tickerOutputStringFactory.makePrintableString(ticker: ticker, printArguments: arguments.printArguments)
                return .success(outputString)

            case .failure(let error):
                switch error {
                case .fetchingValuesData:
                    return .failure(ApplicationError.fetchingValuesIssue)
                case .fetchingStatsData:
                    return .failure(ApplicationError.fetchingStatisticsIssue)
                }
        }
    }

}

public protocol ApplicationPort {

    func makeApplicationResult(userStringArguments: [String]) -> Result<String, ApplicationError>

}
