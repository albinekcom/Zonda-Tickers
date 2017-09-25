public struct TickerNameValidator {
    
    private let validNames: [String]
    
    public init() {
        validNames = [
            "BTCPLN",
            "BTCUSD",
            "BTCEUR",
            
            "LTCPLN",
            "LTCUSD",
            "LTCEUR",
            "LTCBTC",
            
            "ETHPLN",
            "ETHUSD",
            "ETHEUR",
            "ETHBTC",
            
            "LSKPLN",
            "LSKUSD",
            "LSKEUR",
            "LSKBTC",
            
            "BCCPLN",
            "BCCUSD",
            "BCCEUR",
            "BCCBTC",
            
            "DASHPLN",
            "DASHUSD",
            "DASHEUR",
            "DASHBTC",
            
            "GAMEPLN",
            "GAMEUSD",
            "GAMEEUR",
            "GAMEBTC"
        ]
    }
    
    public func isValid(name: String) -> Bool {
        return validNames.contains(name.uppercased())
    }
    
}
