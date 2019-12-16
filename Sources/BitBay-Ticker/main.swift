import BitBay_TickerCore
import Foundation

guard let tickerId = UserArguments.firstArgument else {
    print("[Error] Wrong first argument...")
    
    exit(-1)
}

guard var ticker = Ticker(id: tickerId) else {
    print("[Error] Ticker identifier \"\(tickerId)\" is not valid...")
    
    exit(-1)
}

guard let tickerValuesAPIResponse = TickerValuesAPIResponseFactory.makeTickerValuesAPIResponse(for: ticker.id) else {
    print("[Error] Problem with fetching values from API...")
    
    exit(-1)
}

ticker.setUpValues(using: tickerValuesAPIResponse)

guard let tickerStatisticsAPIResponse = TickerStatisticsAPIResponseFactory.makeTickerStatisticsAPIResponse(for: ticker.id) else {
    print("[Error] Problem with fetching statistics from API...")
    
    exit(-1)
}

ticker.setUpStatistics(using: tickerStatisticsAPIResponse)

guard ticker.isAnyValueFilled else {
    print("[Error] Ticker \"\(tickerId)\" is not supported...")
    
    exit(-1)
}

print(ticker.description(printArguments: UserArguments.printArguments))
