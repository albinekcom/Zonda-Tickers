public struct Arguments {

    private let stringArguments: [String]

    public init(stringArguments: [String]) {
        self.stringArguments = stringArguments
    }

}

extension Arguments: ArgumentsPort {

    public var tickerIdentifier: String? {
        stringArguments.dropFirst().first?.uppercased()
    }

    public var printArguments: [PrintArgument] {
        let printArgumentsStrings = Array(stringArguments.dropFirst(2))
        
        return PrintArgumentFactory().makePrintArguments(from: printArgumentsStrings)
    }

}


public protocol ArgumentsPort {

    var tickerIdentifier: String? { get }
    var printArguments: [PrintArgument] { get }

}
