struct TickerOutputComponent {
    
    let title: String
    let value: Double?
    let isCounterCurrencyAddedAtTheEnd: Bool
    let counterCurrency: String?
    
    var description: String {
        let valueString: String

        if let value = value {
            valueString = String(value)
        } else {
            valueString = "-"
        }

        var description = "\(title): \(valueString)"

        if isCounterCurrencyAddedAtTheEnd, let counterCurrency = counterCurrency {
            description += " \(counterCurrency)"
        }

        return description
    }
    
}
