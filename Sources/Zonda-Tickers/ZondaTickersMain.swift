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
