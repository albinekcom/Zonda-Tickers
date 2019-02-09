import BitBay_TickerCore
import Foundation

guard let tickerName = UserArguments.firstArgument else {
    print("[Error] Wrong first argument...")
    
    exit(-1)
}

guard TickerNameValidator.isValid(name: tickerName) else {
    print("[Error] Ticker name is not valid...")
    
    exit(-1)
}

var ticker = Ticker(name: tickerName)

guard let apiTickerName = ticker.apiTickerName else {
    print("[Error] Cannot generate ticker API name...")
    
    exit(-1)
}

let tickerValuesAPIResponse = TickerValuesAPIResponseFactory.makeTickerValuesAPIResponse(for: apiTickerName)
ticker.setUpValues(using: tickerValuesAPIResponse)

print(ticker.description(printArguments: UserArguments.printArguments))
