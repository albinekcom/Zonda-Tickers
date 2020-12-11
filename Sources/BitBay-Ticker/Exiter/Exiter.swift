import Foundation

enum ExitType: Int {
    case success
    case fail
}

struct Exiter {}

extension Exiter: ExiterPort {
    
    func invokeExit(exitType: ExitType) {
        exit(Int32(exitType.rawValue))
    }
    
}


protocol ExiterPort {
    
    func invokeExit(exitType: ExitType)
}
