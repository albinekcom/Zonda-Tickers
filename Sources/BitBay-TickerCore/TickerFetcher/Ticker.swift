public struct Ticker: Equatable {

    let id: String
    let highestBid: Double?
    let lowestAsk: Double?
    let rate: Double?
    let previousRate: Double?
    let highestRate: Double?
    let lowestRate: Double?
    let volume: Double?
    let average: Double?

}

extension Ticker {

    var baseCurrency: String? { currencyIdentifiers.first }
    var counterCurrency: String? { currencyIdentifiers.last }

    private var currencyIdentifiers: [String] { id.components(separatedBy: "-") }

}
