struct UserArguments {
    
    static var firstArgument: String? {
        return CommandLine.arguments.dropFirst().first
    }
    
    static var printArguments: [String] {
        return Array(CommandLine.arguments.dropFirst(2))
    }
    
}
