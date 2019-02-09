import BitBay_TickerCore
import Foundation

guard let tickerName = UserArguments.firstArgument else {
    print("[Error] Wrong first argument...")
    
    exit(-1)
}

guard TickerNameValidator.isValid(name: tickerName) else {
    print("[Error] Ticker name \"\(tickerName)\" is not valid...")
    
    exit(-1)
}

var ticker = Ticker(name: tickerName)

guard let apiTickerName = ticker.apiTickerName else {
    print("[Error] Cannot generate ticker API name...")
    
    exit(-1)
}

guard let tickerValuesAPIResponse = TickerValuesAPIResponseFactory.makeTickerValuesAPIResponse(for: apiTickerName) else {
    print("[Error] Problem with receiving values form API...")
    
    exit(-1)
}

ticker.setUpValues(using: tickerValuesAPIResponse)

guard ticker.areAllValuesFilled else {
    print("[Error] Ticker \"\(tickerName)\" is not supported right now...")
    
    exit(-1)
}

print(ticker.description(printArguments: UserArguments.printArguments))
