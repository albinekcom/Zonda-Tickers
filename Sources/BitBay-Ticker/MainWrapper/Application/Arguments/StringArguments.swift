struct StringArguments {
    
    private let arguments: [String]
    
    init(arguments: [String] = CommandLine.arguments) {
        self.arguments = arguments
    }
    
}

extension StringArguments: StringArgumentsPort {
    
    var tickerIdentifier: String? { arguments.dropFirst().first?.uppercased() }
    var printArgumentStrings: [String] { Array(arguments.dropFirst(2)) }
    
}

protocol StringArgumentsPort {
    
    var tickerIdentifier: String? { get }
    var printArgumentStrings: [String] { get }
    
}
