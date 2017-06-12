import BitBay_TickerCore

private var userArgument: String? {
    if CommandLine.arguments.count > 1 {
       return CommandLine.arguments[1]
    } else {
        return nil
    }
}

// MARK: - Main Method

if let userArgument = userArgument, let ticker = TickerFactory.makeTicker(named: userArgument) {
    print(ticker)
}
