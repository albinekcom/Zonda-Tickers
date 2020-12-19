import Foundation

public struct MainWrapper {

    private let application: ApplicationPort

    public init(application: ApplicationPort = Application()) {
        self.application = application
    }

    public func makeMainOutcome(userStringArguments: [String]) -> MainOutcome {
        let applicationResult = application.makeApplicationResult(userStringArguments: userStringArguments)

        return MainOutcomeFactory().makeOutcome(fromApplicationResult: applicationResult)
    }
}
