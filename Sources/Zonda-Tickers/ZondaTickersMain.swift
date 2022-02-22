@main
struct ZondaTickersMain {
    
    static var tickersRepositoryType: AnyTickersRepository.Type = TickersRepository.self
    static var printer: Printer.Type = SystemPrinter.self

    static func main() async {
        let userArguments = UserArguments(argumentStrings: Array(CommandLine.arguments.dropFirst()))
        
        do {
            try await tickersRepositoryType.init().loadTickers(tickerIds: userArguments.tickerIds,
                                                               shouldLoadValues: userArguments.shouldLoadValues,
                                                               shouldLoadStatistics: userArguments.shouldLoadStatistics).forEach {
                printer.display(text: $0.outputString(printArguments: userArguments.printArguments))
            }
        } catch let error {
            printer.display(text: "Error: \(error.localizedDescription)")
        }
    }
    
}

private struct SystemPrinter: Printer {
    
    static func display(text: String) {
        print(text)
    }
    
}
