import Foundation

struct UserArguments {
    
    let tickerIds: [String]
    let printArguments: [PrintArgument]
    
    init(argumentStrings: [String] = Array(CommandLine.arguments.dropFirst())) {
        tickerIds = argumentStrings.compactMap { $0.isTickerId ? $0.lowercased() : nil }
        printArguments = argumentStrings
            .compactMap { PrintArgument(rawValue: String($0.dropFirst(2))) }
            .uniqued()
    }
    
}

private extension String {
    
    var isTickerId: Bool {
        guard let regex = try? NSRegularExpression(pattern: #"^[^-]+-[^-]+$"#) else { return false }

        return regex.firstMatch(in: self, range: NSRange(location: 0, length: count)) != nil
    }
    
}

private extension Array where Element: Hashable {
    
    func uniqued() -> [Element] {
        var set = Set<Element>()
        
        return filter { set.insert($0).inserted }
    }
    
}
