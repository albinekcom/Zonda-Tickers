import Foundation

struct ValueFormatter {
    
    private let numberFormatter = NumberFormatter()
    
    init(locale: Locale) {
        numberFormatter.numberStyle = .decimal
        numberFormatter.locale = locale
    }
    
    func string(from value: Double?, fractionDigits: Int) -> String {
        guard let value = value else { return  "-" }
        
        numberFormatter.minimumFractionDigits = fractionDigits
        numberFormatter.maximumFractionDigits = fractionDigits
        
        return numberFormatter.string(from: NSNumber(value: value)) ?? "-"
    }
    
}
