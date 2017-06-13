import BitBay_TickerCore

private var firstUserArgument: String? {
    if CommandLine.arguments.count > 1 {
       return CommandLine.arguments[1]
    } else {
        return nil
    }
}

// MARK: - Main Method

if let firstUserArgument = firstUserArgument, let ticker = TickerFactory.makeTicker(named: firstUserArgument) {
    let tickerDescription = ticker.description(printArguments: Array(CommandLine.arguments.dropFirst(2)))
    
    print(tickerDescription)
}
