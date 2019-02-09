import Foundation

public struct TickerNameValidator {
    
    public static func isValid(name: String) -> Bool {
        let pattern = "^[^\\/]+\\/[^\\/]+$"

        guard let regex = try? NSRegularExpression(pattern: pattern) else { return false }

        return regex.firstMatch(in: name, options: [], range: NSRange(location: 0, length: name.count)) != nil
    }
    
}
