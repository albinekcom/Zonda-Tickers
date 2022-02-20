import Foundation

struct ValueFormatter {
    
    private let numberFormatter: NumberFormatter
    
    init(locale: Locale) {
        self.numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.locale = locale
    }
    
    func string(from value: Double?, fractionDigits: Int? = nil) -> String {
        guard let value = value else { return  "-" }
        
        if let fractionDigits = fractionDigits {
            numberFormatter.minimumFractionDigits = fractionDigits
            numberFormatter.maximumFractionDigits = fractionDigits
        } else {
            numberFormatter.minimumFractionDigits = 0
            numberFormatter.maximumFractionDigits = 0
        }
        
        return numberFormatter.string(from: NSNumber(value: value)) ?? "-"
    }
    
}
