enum ApplicationError: Error {
    case wrongTickerIdentifier
    case tickerIdentifierIsNotValid
    case fetchingValuesIssue
    case fetchingStatisticsIssue
    case tickerIdentifierIsNotSupported
}

struct Application {
    
    private let arguments: ArgumentsPort
    private let tickerIdentifierValidator: TickerIdentifierValidatorPort
    private let tickerFetcher: TickerFetcherPort
    private let tickerOutputStringFactory: TickerOutputStringFactoryPort
    
    init(arguments: ArgumentsPort = Arguments(),
         tickerIdentifierValidator: TickerIdentifierValidatorPort = TickerIdentifierValidator(),
         tickerFetcher: TickerFetcherPort = TickerFetcher(),
         tickerOutputStringFactory: TickerOutputStringFactoryPort = TickerOutputStringFactory()) {
        self.arguments = arguments
        self.tickerIdentifierValidator = tickerIdentifierValidator
        self.tickerFetcher = tickerFetcher
        self.tickerOutputStringFactory = tickerOutputStringFactory
    }
}

extension Application: ApplicationPort {
    
    func makeApplicationResult() -> Result<String, ApplicationError> {
        guard let tickerIdentifier = arguments.tickerIdentifier else {
            return .failure(ApplicationError.wrongTickerIdentifier)
        }
        
        guard tickerIdentifierValidator.isValid(tickerIdentifier: tickerIdentifier) else {
            return .failure(ApplicationError.tickerIdentifierIsNotValid)
        }
        
        let fetcherResult = tickerFetcher.fetchTicker(tickerIdentifier: tickerIdentifier)
        
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

protocol ApplicationPort {
    
    func makeApplicationResult() -> Result<String, ApplicationError>
    
}
