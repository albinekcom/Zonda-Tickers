import XCTest
@testable import Zonda_Tickers

final class ZondaTickersMainTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_main_forNormalExecution() async {
        let zondaTickersMainType = ZondaTickersMain.self
        zondaTickersMainType.tickersRepositoryType = TickersRepositoryNormalStub.self
        zondaTickersMainType.printer = PrinterMock.self
        
        await zondaTickersMainType.main()
        
        XCTAssertEqual("Ticker: LSK-USD", PrinterMock.displayedTexts.removeLast())
        XCTAssertEqual("Ticker: ETH-PLN", PrinterMock.displayedTexts.removeLast())
        XCTAssertEqual("Ticker: BTC-PLN", PrinterMock.displayedTexts.removeLast())
    }
    
    func test_main_withErroerExecution() async {
        let zondaTickersMainType = ZondaTickersMain.self
        zondaTickersMainType.tickersRepositoryType = TickersRepositoryErrorStub.self
        zondaTickersMainType.printer = PrinterMock.self
        
        await zondaTickersMainType.main()
        
        XCTAssertEqual("Error: Test Error Description", PrinterMock.displayedTexts.last)
    }
    
}

// MARK: - Helpers

private struct PrinterMock: Printer {
    
    static var displayedTexts: [String] = []
    
    static func display(text: String) {
        displayedTexts.append(text)
    }
    
}

private struct TickersRepositoryNormalStub: AnyTickersRepository {
    
    func loadTickers(tickerIds: [String], shouldLoadValues: Bool, shouldLoadStatistics: Bool) async throws -> [Ticker] {
        [Ticker(id: "btc-pln", apiTickerValuesItem: nil, apiTickerStatisticsItem: nil),
         Ticker(id: "eth-pln", apiTickerValuesItem: nil, apiTickerStatisticsItem: nil),
         Ticker(id: "lsk-usd", apiTickerValuesItem: nil, apiTickerStatisticsItem: nil)]
    }
    
}

private struct TickersRepositoryErrorStub: AnyTickersRepository {
    
    func loadTickers(tickerIds: [String], shouldLoadValues: Bool, shouldLoadStatistics: Bool) async throws -> [Ticker] {
        throw ErrorStub.someError
    }
    
}

private enum ErrorStub: Error, LocalizedError {
    
    case someError
    
    var errorDescription: String? {
        switch self {
        case .someError:
            return "Test Error Description"
        }
    }
    
}
