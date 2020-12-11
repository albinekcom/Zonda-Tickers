import Foundation

protocol TickerIdentifierValidatorPort {
    
    func isValid(tickerIdentifier: String) -> Bool
    
}

struct TickerIdentifierValidator {

    private let regularExpressionPattern = #"^[^-]+-[^-]+$"#
    
}

extension TickerIdentifierValidator: TickerIdentifierValidatorPort {
    
    func isValid(tickerIdentifier: String) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: regularExpressionPattern) else { return false }

        return regex.firstMatch(in: tickerIdentifier, options: [], range: NSRange(location: 0, length: tickerIdentifier.count)) != nil
    }
    
}
