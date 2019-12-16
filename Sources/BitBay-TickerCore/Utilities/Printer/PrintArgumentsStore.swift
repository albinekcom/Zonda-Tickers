public struct PrintArgumentsStore {
    
    let availableTickerValuesPrintArguments: [PrintArgument] = [.highestBid, .lowestAsk, .rate, .previousRate]
    let availableTickerStatisticsPrintArguments: [PrintArgument] = [.highestRate, .lowestRate, .volume, .average]
    
    public let printArguments: [PrintArgument]
    
    public init(userPrintArguments: [String]) {
        if userPrintArguments.isEmpty {
            printArguments = PrintArgument.allCases
        } else {
            printArguments = userPrintArguments.compactMap { PrintArgument(rawValue: $0) }
        }
    }
    
    public var shouldFetchTickerValues: Bool {
        isAnyPrintArgument(in: printArguments, isIncludedIn: availableTickerValuesPrintArguments)
    }
    
    public var shouldFetchTickerStatistics: Bool {
        isAnyPrintArgument(in: printArguments, isIncludedIn: availableTickerStatisticsPrintArguments)
    }
    
    private func isAnyPrintArgument(in printArguments: [PrintArgument], isIncludedIn availablePrintArguments: [PrintArgument]) -> Bool {
        for printArgument in printArguments {
            if availablePrintArguments.contains(printArgument) {
                return true
            }
        }
        
        return false
    }
    
}
