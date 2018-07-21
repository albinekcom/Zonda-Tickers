import Foundation

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
        
        "KZCPLN",
        "KZCEUR",
        "KZCUSD",
        "KZCBTC",
        
        "XRPPLN",
        "XRPEUR",
        "XRPUSD",
        "XRPBTC",
        
        "XINPLN",
        "XINEUR",
        "XINUSD",
        "XINBTC",
        
        "XMRPLN",
        "XMREUR",
        "XMRUSD",
        "XMRBTC",
        
        "ZECPLN",
        "ZECEUR",
        "ZECUSD",
        "ZECBTC",
        
        "GNTPLN",
        "GNTEUR",
        "GNTUSD",
        "GNTBTC",
        
        "OMGPLN",
        "OMGEUR",
        "OMGUSD",
        "OMGBTC",
        
        "FTOPLN",
        "FTOEUR",
        "FTOUSD",
        "FTOBTC"
    ]
    
    public static func isValid(name: String) -> Bool {
        return TickerNameValidator.validNames.contains(name.uppercased())
    }
    
}
