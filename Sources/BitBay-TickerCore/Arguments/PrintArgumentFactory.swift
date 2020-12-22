struct PrintArgumentFactory {

    func makePrintArguments(from printStringArguments: [String]) -> [PrintArgument] {
        var printArguments: [PrintArgument] = []

        if printStringArguments.isEmpty {
            printArguments = [.highestBid, .lowestAsk, .rate, .previousRate, .highestRate, .lowestRate, .volume, .average]
        } else {
            printArguments = printStringArguments.compactMap { makePrintArgument(from: $0) }
        }

        return printArguments
    }

    private func makePrintArgument(from printStringArgument: String) -> PrintArgument? {
        PrintArgument(rawValue: printStringArgument)
    }
}
