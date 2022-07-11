import Foundation

extension Ticker {
    
    func outputString(
        printArguments: [PrintArgument],
        locale: Locale = .current
    ) -> String {
        var outputs = ["Ticker: \(id.uppercased())"]
        
        outputs += printArguments.map {
            outputComponent(
                printArgument: $0,
                locale: locale
            ).description
        }
        
        return outputs.joined(separator: ", ")
    }
    
    private func outputComponent(
        printArgument: PrintArgument,
        locale: Locale
    ) -> OutputComponent {
        let secondCurrencyId = secondCurrencyId.uppercased()
        let valueFormatter = ValueFormatter(locale: locale)
        
        switch printArgument {
        case .average:
            return .init(
                title: "average",
                valueString: valueFormatter.string(
                    from: average,
                    fractionDigitsCount: secondCurrencyFractionDigitsCount
                ),
                secondCurrencyIdAtTheEnd: secondCurrencyId
            )
            
        case .change:
            return .init(
                title: "change",
                valueString: valueFormatter.string(
                    from: change,
                    fractionDigitsCount: 2,
                    numberStyle: .percent,
                    positivePrefix: "+"
                ),
                secondCurrencyIdAtTheEnd: nil
            )
            
        case .highestBid:
            return .init(
                title: "highest bid",
                valueString: valueFormatter.string(
                    from: highestBid,
                    fractionDigitsCount: secondCurrencyFractionDigitsCount
                ),
                secondCurrencyIdAtTheEnd: secondCurrencyId
            )
            
        case .highestRate:
            return .init(
                title: "highest rate",
                valueString: valueFormatter.string(
                    from: highestRate,
                    fractionDigitsCount: secondCurrencyFractionDigitsCount
                ),
                secondCurrencyIdAtTheEnd: secondCurrencyId
            )

        case .lowestAsk:
            return .init(
                title: "lowest ask",
                valueString: valueFormatter.string(
                    from: lowestAsk,
                    fractionDigitsCount: secondCurrencyFractionDigitsCount
                ),
                secondCurrencyIdAtTheEnd: secondCurrencyId
            )
            
        case .lowestRate:
            return .init(
                title: "lowest rate",
                valueString: valueFormatter.string(
                    from: lowestRate,
                    fractionDigitsCount: secondCurrencyFractionDigitsCount
                ),
                secondCurrencyIdAtTheEnd: secondCurrencyId
            )

        case .previousRate:
            return .init(
                title: "previous rate",
                valueString: valueFormatter.string(
                    from: previousRate,
                    fractionDigitsCount: secondCurrencyFractionDigitsCount
                ),
                secondCurrencyIdAtTheEnd: secondCurrencyId
            )
            
        case .rate:
            return .init(
                title: "rate",
                valueString: valueFormatter.string(
                    from: rate,
                    fractionDigitsCount: secondCurrencyFractionDigitsCount
                ),
                secondCurrencyIdAtTheEnd: secondCurrencyId
            )

        case .volume:
            return .init(
                title: "volume",
                valueString: valueFormatter.string(
                    from: volume,
                    fractionDigitsCount: nil
                ),
                secondCurrencyIdAtTheEnd: nil
            )
            
        case .volumeValue:
            return .init(
                title: "volume value",
                valueString: valueFormatter.string(
                    from: volumeValue,
                    fractionDigitsCount: secondCurrencyFractionDigitsCount
                ),
                secondCurrencyIdAtTheEnd: secondCurrencyId
            )
        }
    }
    
}

private struct OutputComponent {
    
    let description: String
    
    init(
        title: String,
        valueString: String,
        secondCurrencyIdAtTheEnd: String?
    ) {
        var description = "\(title): \(valueString)"
        
        if let secondCurrencyAtTheEnd = secondCurrencyIdAtTheEnd {
            description += " \(secondCurrencyAtTheEnd)"
        }

        self.description = description
    }
    
}
