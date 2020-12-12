public struct TickerOutputStringFactory {

    public init() {}

}

extension TickerOutputStringFactory: TickerOutputStringFactoryPort {

    public func makePrintableString(ticker: Ticker, printArguments: [PrintArgument]) -> String {
        let tickerString = "Ticker \(ticker.id.uppercased())"

        let valuesString = printArguments.map { TickerOutputComponentFactory().makesTickerOutputComponent(ticker: ticker, printArgument: $0).description }.joined(separator: ", ")

        return [tickerString, valuesString].joined(separator: ", ")
    }

}

public protocol TickerOutputStringFactoryPort {

    func makePrintableString(ticker: Ticker, printArguments: [PrintArgument]) -> String

}
