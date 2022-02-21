import Foundation

struct ValueFormatter {
    
    private let locale: Locale
    private let numberFormatterType: NumberFormatter.Type
    
    init(locale: Locale, numberFormatterType: NumberFormatter.Type = NumberFormatter.self) {
        self.locale = locale
        self.numberFormatterType = numberFormatterType
    }
    
    func string(from value: Double?, fractionDigits: Int? = nil) -> String {
        guard let value = value else { return  "-" }
        
        let numberFormatter = numberFormatterType.init()
        numberFormatter.numberStyle = .decimal
        numberFormatter.locale = locale
        
        if let fractionDigits = fractionDigits {
            numberFormatter.minimumFractionDigits = fractionDigits
            numberFormatter.maximumFractionDigits = fractionDigits
        }
        
        return numberFormatter.string(from: NSNumber(value: value)) ?? "-"
    }
    
}
