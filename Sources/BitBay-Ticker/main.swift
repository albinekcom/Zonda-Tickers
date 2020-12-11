struct Main {

    private let application: ApplicationPort
    private let exiter: ExiterPort
    private let printer: PrinterPort

    init(application: ApplicationPort = Application(),
         printer: PrinterPort = Printer(),
         exiter: ExiterPort = Exiter()) {
        self.application = application
        self.printer = printer
        self.exiter = exiter
    }

    func start() {
        let applicationResult = application.makeApplicationResult()

        let applicationResultOutput = ApplicationResultOutputFactory().makeApplicationResultOutput(from: applicationResult)

        printer.invokePrint(string: applicationResultOutput.outputString)
        exiter.invokeExit(exitType: applicationResultOutput.exitType)
    }

}

Main().start()
