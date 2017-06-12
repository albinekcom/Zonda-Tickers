import BitBay_TickerCore

private var userArgument: String? {
    if CommandLine.arguments.count > 1 {
       return CommandLine.arguments[1]
    } else {
        return nil
    }
}

private var isValidUserArgument: Bool {
    guard let userArgument = userArgument else { return false }
    
    return TickerNameValidator().isValid(name: userArgument)
}

// MARK: - Main Method

if let userArgument = userArgument {
    let ticker = TickerFactory.makeTicker(named: userArgument)
    
    print(ticker)
}
