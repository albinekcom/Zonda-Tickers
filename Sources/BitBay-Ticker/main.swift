import BitBay_TickerCore
import Foundation

let mainOutcome = MainWrapper().makeMainOutcome(userStringArguments: CommandLine.arguments)

print(mainOutcome.text)
exit(mainOutcome.exitType.rawValue)
