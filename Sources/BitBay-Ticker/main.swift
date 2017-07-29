import BitBay_TickerCore

private var userFirstArgument: String? {
    return CommandLine.arguments.dropFirst().first
}

// MARK: - Main Method

if let userFirstArgument = userFirstArgument, let ticker = TickerFactory.makeTicker(named: userFirstArgument) {
    let userPrintArguments = Array(CommandLine.arguments.dropFirst(2))
    
    print(ticker.description(printArguments: userPrintArguments))
}
