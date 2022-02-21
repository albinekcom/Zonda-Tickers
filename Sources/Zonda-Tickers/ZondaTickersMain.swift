@main
struct ZondaTickersMain {

    static func main() async {
        let userArguments = UserArguments(argumentStrings: Array(CommandLine.arguments.dropFirst()))
        
        do {
            try await TickersRepository().loadTickers(tickerIds: userArguments.tickerIds,
                                                      shouldLoadValues: userArguments.shouldLoadValues,
                                                      shouldLoadStatistics: userArguments.shouldLoadStatistics).forEach {
                print($0.outputString(printArguments: userArguments.printArguments))
            }
        } catch let error {
            print("Error: \(error.localizedDescription)")
        }
    }
    
}

// TODO: Add unit tests for "ValueFormatter"
// TODO: Add unit tests for "Ticker+OutputString"
// TODO: Add unit tests for "Ticker+InitFromApiResponses"
// TODO: Add unit tests for "UserArguments"
// TODO: Add unit tests for "RemoteTickersRepository"
// TODO: Add unit tests for "TickersRepository"
