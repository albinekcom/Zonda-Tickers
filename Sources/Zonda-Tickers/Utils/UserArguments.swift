import Foundation

struct UserArguments {
    
    private let userArgumentStrings: [String]
    
    init(argumentStrings: [String]) {
        userArgumentStrings = argumentStrings
    }
    
    var tickerIds: [String] {
        userArgumentStrings.compactMap { $0.isTickerId ? $0.lowercased() : nil }
    }
    
    var printArguments: [PrintArgument] {
        userArgumentStrings.compactMap { PrintArgument(rawValue: String($0.dropFirst(2))) }
    }
    
}

extension UserArguments {
    
    var shouldLoadValues: Bool {
        userPrintArgumentsContainsAtLeastOne(of: [.highestBid, .lowestAsk, .rate, .previousRate, .change])
    }
    
    var shouldLoadStatistics: Bool {
        userPrintArgumentsContainsAtLeastOne(of: [.highestRate, .lowestRate, .volume, .average, .change])
    }
    
    private func userPrintArgumentsContainsAtLeastOne(of otherPrintArguments: [PrintArgument]) -> Bool {
        Set(printArguments).intersection(otherPrintArguments).isEmpty == false
    }
    
}

private extension String {
    
    var isTickerId: Bool {
        guard let regex = try? NSRegularExpression(pattern: #"^[^-]+-[^-]+$"#) else { return false }

        return regex.firstMatch(in: self, range: NSRange(location: 0, length: count)) != nil
    }
    
}
