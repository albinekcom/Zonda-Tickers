import XCTest

final class FunctionalApplicationTests: XCTestCase {
    
    func test_application() throws {
        let fooBinary = URL.productsDirectory.appendingPathComponent("Zonda-Tickers")
        
        let pipe = Pipe()
        
        let process = Process()
        process.executableURL = fooBinary
        process.arguments = [
            "btc-pln",
            "wrong",
            "eth-pln",
            "--rate",
            "--average",
            "--rate",
            "--highestBid",
            "--unknown"
        ]
        process.standardOutput = pipe
        
        try process.run()
        process.waitUntilExit()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(
            data: data,
            encoding: .utf8
        )!
        
        XCTAssertTrue(output.contains("Ticker: BTC-PLN,"))
        XCTAssertTrue(output.contains("Ticker: ETH-PLN,"))
        XCTAssertFalse(output.contains("Ticker: LSK-USD,"))
        XCTAssertTrue(output.contains("rate: "))
        XCTAssertTrue(output.contains("average: "))
        XCTAssertTrue(output.contains("highest bid: "))
    }
    
}

private extension URL {
    
    static var productsDirectory: URL {
        for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(".xctest") {
            return bundle.bundleURL.deletingLastPathComponent()
        }
        
        fatalError("couldn't find the products directory")
    }
    
}
