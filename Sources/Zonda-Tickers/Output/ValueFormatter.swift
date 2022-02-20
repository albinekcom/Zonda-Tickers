import Foundation

struct ValueFormatter {
    
    private let locale: Locale
    
    init(locale: Locale) {
        self.locale = locale
    }
    
    func string(from value: Double?, fractionDigits: Int? = nil) -> String {
        guard let value = value else { return  "-" }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.locale = locale
        
        if let fractionDigits = fractionDigits {
            numberFormatter.minimumFractionDigits = fractionDigits
            numberFormatter.maximumFractionDigits = fractionDigits
        }
        
        return numberFormatter.string(from: NSNumber(value: value)) ?? "-"
    }
    
}
