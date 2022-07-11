@testable import Zonda_Tickers

extension UserArguments {
    
    static let stub = UserArguments(argumentStrings: [
        "btc-pln",
        "wrong",
        "eth-pln",
        "--rate",
        "--average",
        "--rate",
        "--highestBid",
        "--unknown"
    ])
    
}
