import XCTest
@testable import Zonda_Tickers

final class MainTests: XCTestCase {
    
    func test_main() async throws {
        let printer = PrinterMock()
        
        let mainType = Main.self
        mainType.repository = RepositoryStub()
        mainType.userArguments = UserArguments.stub
        mainType.printer = printer
        
        try await mainType.main()
        
        XCTAssertEqual(
            "Ticker: BTC-PLN, rate: - PLN, average: - PLN, highest bid: - PLN",
            printer.displayedTexts.first
        )
        XCTAssertEqual(
            "Ticker: ETH-PLN, rate: - PLN, average: - PLN, highest bid: - PLN",
            printer.displayedTexts.last
        )
    }
    
}

private final class PrinterMock: Printer {
    
    var displayedTexts: [String] = []
    
    func display(text: String) {
        displayedTexts.append(text)
    }
    
}

private struct RepositoryStub: TickersRepository {
    
    func loadTickers() async throws -> [Ticker] {
        [
            .init(tickerId: "btc-pln"),
            .init(tickerId: "eth-pln"),
            .init(tickerId: "lsk-pln")
        ]
    }
    
}

private extension Ticker {
    
    init(tickerId: String) {
        self.init(
            id: tickerId,
            secondCurrencyId: "pln",
            secondCurrencyFractionDigitsCount: 2,
            average: nil,
            highestBid: nil,
            highestRate: nil,
            lowestAsk: nil,
            lowestRate: nil,
            previousRate: nil,
            rate: nil,
            volume: nil
        )
    }
    
}
