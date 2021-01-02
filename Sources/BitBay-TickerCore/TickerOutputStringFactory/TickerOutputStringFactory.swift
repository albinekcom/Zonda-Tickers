import Foundation

public struct TickerOutputStringFactory {
    
    private let locale: Locale

    public init(locale: Locale) {
        self.locale = locale
    }

}

extension TickerOutputStringFactory: TickerOutputStringFactoryPort {

    public func makePrintableString(ticker: Ticker, printArguments: [PrintArgument]) -> String {
        let tickerString = "Ticker \(ticker.id.uppercased())"

        let valuesString = printArguments.map { TickerOutputComponentFactory(locale: locale).makesTickerOutputComponent(ticker: ticker, printArgument: $0).description }.joined(separator: ", ")

        return [tickerString, valuesString].joined(separator: ", ")
    }

}

public protocol TickerOutputStringFactoryPort {

    func makePrintableString(ticker: Ticker, printArguments: [PrintArgument]) -> String

}
