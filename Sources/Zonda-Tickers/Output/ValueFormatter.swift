import Foundation

struct ValueFormatter {
    
    private let numberFormatter = NumberFormatter()
    
    init(locale: Locale) {
        numberFormatter.locale = locale
    }
    
    func string(from value: Double?, fractionDigits: Int, numberStyle: NumberFormatter.Style = .decimal) -> String {
        guard let value = value else { return  "-" }
        
        numberFormatter.minimumFractionDigits = fractionDigits
        numberFormatter.maximumFractionDigits = fractionDigits
        numberFormatter.numberStyle = numberStyle
        
        return numberFormatter.string(from: NSNumber(value: value)) ?? "-"
    }
    
}
