import Foundation

struct TickerOutputComponent {
    
    private let title: String
    private let value: Double?
    private let isCounterCurrencyAddedAtTheEnd: Bool
    private let counterCurrency: String?
    
    private let numberFormatter: NumberFormatter
    
    init(title: String,
         value: Double?,
         isCounterCurrencyAddedAtTheEnd: Bool,
         counterCurrency: String?,
         numberFormatter: NumberFormatter) {
        self.title = title
        self.value = value
        self.isCounterCurrencyAddedAtTheEnd = isCounterCurrencyAddedAtTheEnd
        self.counterCurrency = counterCurrency
        self.numberFormatter = numberFormatter
    }
    
    var description: String {
        var description = "\(title): \(valueString)"

        if isCounterCurrencyAddedAtTheEnd, let counterCurrency = counterCurrency {
            description += " \(counterCurrency)"
        }

        return description
    }
    
    private var valueString: String {
        guard let value = value else { return "-" }
        guard let formattedString = numberFormatter.string(from: NSNumber(value: value)) else { return String(value) }
        
        return formattedString
    }
    
}
