struct Arguments {
    
    private let stringArguments: StringArgumentsPort
    
    init(stringArguments: StringArgumentsPort = StringArguments()) {
        self.stringArguments = stringArguments
    }
    
}

extension Arguments: ArgumentsPort {
    
    var tickerIdentifier: String? {
        stringArguments.tickerIdentifier
    }
    
    var printArguments: [PrintArgument] {
        PrintArgumentFactory().makePrintArguments(from: stringArguments.printArgumentStrings)
    }
    
}


protocol ArgumentsPort {
    
    var tickerIdentifier: String? { get }
    var printArguments: [PrintArgument] { get }
    
}

