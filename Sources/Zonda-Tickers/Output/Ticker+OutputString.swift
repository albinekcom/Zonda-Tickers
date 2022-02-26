import Foundation

extension Ticker {
    
    func outputString(printArguments: [PrintArgument], locale: Locale = .current) -> String {
        var outputs: [String] = []
        
        outputs.append("Ticker: \(id.uppercased())")
        
        outputs += printArguments.compactMap {
            outputComponent(ticker: self, printArgument: $0, locale: locale)?.description
        }
        
        return outputs.joined(separator: ", ")
    }
    
    private func outputComponent(ticker: Ticker, printArgument: PrintArgument, locale: Locale) -> OutputComponent? {
        guard let counterCurrencyAddedAtTheEnd = ticker.counterCurrencyId?.uppercased() else { return nil }
        
        let valueFormatter = ValueFormatter(locale: locale)
        
        switch printArgument {
        case .highestBid:
            return .init(title: "highest bid",
                         valueString: valueFormatter.string(from: ticker.highestBid, fractionDigits: ticker.counterCurrencyFractionDigits),
                         counterCurrencyAddedAtTheEnd: counterCurrencyAddedAtTheEnd)

        case .lowestAsk:
            return .init(title: "lowest ask",
                         valueString: valueFormatter.string(from: ticker.lowestAsk, fractionDigits: ticker.counterCurrencyFractionDigits),
                         counterCurrencyAddedAtTheEnd: counterCurrencyAddedAtTheEnd)

        case .rate:
            return .init(title: "rate",
                         valueString: valueFormatter.string(from: ticker.rate, fractionDigits: ticker.counterCurrencyFractionDigits),
                         counterCurrencyAddedAtTheEnd: counterCurrencyAddedAtTheEnd)

        case .previousRate:
            return .init(title: "previous rate",
                         valueString: valueFormatter.string(from: ticker.previousRate, fractionDigits: ticker.counterCurrencyFractionDigits),
                         counterCurrencyAddedAtTheEnd: counterCurrencyAddedAtTheEnd)

        case .highestRate:
            return .init(title: "highest rate",
                         valueString: valueFormatter.string(from: ticker.highestRate, fractionDigits: ticker.counterCurrencyFractionDigits),
                         counterCurrencyAddedAtTheEnd: counterCurrencyAddedAtTheEnd)

        case .lowestRate:
            return .init(title: "lowest rate",
                         valueString: valueFormatter.string(from: ticker.lowestRate, fractionDigits: ticker.counterCurrencyFractionDigits),
                         counterCurrencyAddedAtTheEnd: counterCurrencyAddedAtTheEnd)

        case .volume:
            return .init(title: "volume",
                         valueString: valueFormatter.string(from: ticker.volume, fractionDigits: ticker.counterCurrencyFractionDigits),
                         counterCurrencyAddedAtTheEnd: counterCurrencyAddedAtTheEnd)

        case .average:
            return .init(title: "average",
                         valueString: valueFormatter.string(from: ticker.average, fractionDigits: ticker.counterCurrencyFractionDigits),
                         counterCurrencyAddedAtTheEnd: counterCurrencyAddedAtTheEnd)
        }
    }
    
}

private struct OutputComponent {
    
    let title: String
    let valueString: String
    let counterCurrencyAddedAtTheEnd: String
    
    var description: String {
        var description = "\(title): \(valueString)"

        description += " \(counterCurrencyAddedAtTheEnd)"

        return description
    }
    
}
