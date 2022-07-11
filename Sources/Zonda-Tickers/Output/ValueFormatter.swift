import Foundation

struct ValueFormatter {
    
    private let numberFormatter: NumberFormatter
    
    init(
        locale: Locale,
        numberFormatter: NumberFormatter = NumberFormatter()
    ) {
        self.numberFormatter = numberFormatter
        numberFormatter.locale = locale
    }
    
    func string(
        from value: Double?,
        fractionDigitsCount: Int?,
        numberStyle: NumberFormatter.Style = .decimal,
        positivePrefix: String = ""
    ) -> String {
        guard let value = value else { return  "-" }
        
        numberFormatter.numberStyle = numberStyle
        numberFormatter.positivePrefix = positivePrefix
        
        if let fractionDigitsCount = fractionDigitsCount {
            numberFormatter.minimumFractionDigits = fractionDigitsCount
            numberFormatter.maximumFractionDigits = fractionDigitsCount
        }
        
        return numberFormatter.string(from: NSNumber(value: value)) ?? "-"
    }
    
}
