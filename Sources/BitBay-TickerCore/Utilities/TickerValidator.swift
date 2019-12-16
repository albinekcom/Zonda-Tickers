import Foundation

public struct TickerValidator {
    
    private static let pattern = #"^[^-]+-[^-]+$"#
    
    public static func isIdValid(_ id: String) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: pattern) else { return false }

        return regex.firstMatch(in: id, options: [], range: NSRange(location: 0, length: id.count)) != nil
    }
    
}
