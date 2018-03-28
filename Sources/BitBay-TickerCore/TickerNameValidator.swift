public struct TickerNameValidator {
    
    private static let validNames = [
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
        "GAMEBTC",
        
        "BTGPLN",
        "BTGUSD",
        "BTGEUR",
        "BTGBTC",
        
        "KZCBTC",
        
        "PLNXRP",
        "EURXRP",
        "USDXRP",
        "BTCXRP",
        
        "BTCXIN"
    ]
    
    public static func isValid(name: String) -> Bool {
        return TickerNameValidator.validNames.contains(name.uppercased())
    }
    
}
