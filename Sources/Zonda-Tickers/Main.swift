@main
struct Main {
    
    static var userArguments = UserArguments()
    static var repository: TickersRepository = Repository()
    static var printer: Printer = SystemPrinter()
    
    static func main() async throws {
        let tickers = try await repository.loadTickers()
        
        userArguments.tickerIds
            .compactMap { userTickerId in tickers.first(where: { $0.id == userTickerId }) }
            .map { $0.outputString(printArguments: userArguments.printArguments) }
            .forEach { printer.display(text: $0) }
    }
    
}

private struct SystemPrinter: Printer {
    
    func display(text: String) {
        print(text)
    }
    
}
