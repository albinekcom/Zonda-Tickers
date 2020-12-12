import XCTest
@testable import BitBay_TickerCore

final class ShouldFetchPropertiesFactoryTests: XCTestCase {

    func testShouldFetchForPrintArgumentHighestBid() throws {
        let factory = ShouldFetchPropertiesFactory(printArguments: [.highestBid])
        
        XCTAssertTrue(factory.shouldFetchValues)
        XCTAssertFalse(factory.shouldFetchStats)
    }
    
    func testShouldFetchForPrintArgumentLowestAsk() throws {
        let factory = ShouldFetchPropertiesFactory(printArguments: [.lowestAsk])
        
        XCTAssertTrue(factory.shouldFetchValues)
        XCTAssertFalse(factory.shouldFetchStats)
    }
    
    func testShouldFetchForPrintArgumentRate() throws {
        let factory = ShouldFetchPropertiesFactory(printArguments: [.rate])
        
        XCTAssertTrue(factory.shouldFetchValues)
        XCTAssertFalse(factory.shouldFetchStats)
    }
    
    func testShouldFetchForPrintArgumentPreviousRate() throws {
        let factory = ShouldFetchPropertiesFactory(printArguments: [.previousRate])
        
        XCTAssertTrue(factory.shouldFetchValues)
        XCTAssertFalse(factory.shouldFetchStats)
    }
    
    func testShouldFetchForPrintArgumentHighestRate() throws {
        let factory = ShouldFetchPropertiesFactory(printArguments: [.highestRate])
        
        XCTAssertFalse(factory.shouldFetchValues)
        XCTAssertTrue(factory.shouldFetchStats)
    }
    
    func testShouldFetchForPrintArgumentLowestRate() throws {
        let factory = ShouldFetchPropertiesFactory(printArguments: [.lowestRate])
        
        XCTAssertFalse(factory.shouldFetchValues)
        XCTAssertTrue(factory.shouldFetchStats)
    }
    
    func testShouldFetchForPrintArgumentVolume() throws {
        let factory = ShouldFetchPropertiesFactory(printArguments: [.volume])
        
        XCTAssertFalse(factory.shouldFetchValues)
        XCTAssertTrue(factory.shouldFetchStats)
    }
    
    func testShouldFetchForPrintArgumentAverage() throws {
        let factory = ShouldFetchPropertiesFactory(printArguments: [.average])
        
        XCTAssertFalse(factory.shouldFetchValues)
        XCTAssertTrue(factory.shouldFetchStats)
    }

}
