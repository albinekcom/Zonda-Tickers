import BitBay_TickerCore

if CommandLine.arguments.count == 2 {
    let userInput = CommandLine.arguments[1]
    
    if TickerNameValidator().isValid(name: userInput) {
        let ticker = TickerFactory.makeTicker(named: userInput)
        
        print(ticker)
    }
}
