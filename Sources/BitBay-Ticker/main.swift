import BitBay_TickerCore

let arguments = CommandLine.arguments

if arguments.count == 2 {
    let userInput = arguments[1]
    
    let ticker = TickerFactory.makeTicker(named: userInput)
    
    print(ticker)
}
