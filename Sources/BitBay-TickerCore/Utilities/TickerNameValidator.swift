import Foundation

public struct TickerNameValidator {
    
    private static let pattern = #"^[^-]+-[^-]+$"#
    
    public static func isValid(name: String) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: pattern) else { return false }

        return regex.firstMatch(in: name, options: [], range: NSRange(location: 0, length: name.count)) != nil
    }
    
}
