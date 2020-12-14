import Foundation

public protocol TickerIdentifierValidatorPort {

    func isValid(tickerIdentifier: String) -> Bool

}

public struct TickerIdentifierValidator {

    private let regularExpressionPattern = #"^[^-]+-[^-]+$"#

    public init() {}

}

extension TickerIdentifierValidator: TickerIdentifierValidatorPort {

    public func isValid(tickerIdentifier: String) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: regularExpressionPattern) else { return false }

        return regex.firstMatch(in: tickerIdentifier, options: [], range: NSRange(location: 0, length: tickerIdentifier.count)) != nil
    }

}
