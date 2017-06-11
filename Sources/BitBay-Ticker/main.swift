import BitBay_TickerCore

let userInput = "BTCPLN"
let ticker = TickerFactory.makeTicker(named: userInput)
print(ticker)
