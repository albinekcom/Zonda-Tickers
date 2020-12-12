struct ShouldFetchPropertiesFactory {
    
    private let printArguments: [PrintArgument]
    
    init(printArguments: [PrintArgument]) {
        self.printArguments = printArguments
    }
    
    var shouldFetchValues: Bool {
        printArguments.contains(.highestBid) || printArguments.contains(.lowestAsk) || printArguments.contains(.rate) || printArguments.contains(.previousRate)
    }
    
    var shouldFetchStats: Bool {
        printArguments.contains(.highestRate) || printArguments.contains(.lowestRate) || printArguments.contains(.volume) || printArguments.contains(.average)
    }
    
}
