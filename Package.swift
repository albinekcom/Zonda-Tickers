// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "BitBay-Ticker",
    
    products: [
        .executable(name: "BitBay-Ticker", targets: ["BitBay-Ticker"]),
        .library(name: "BitBay-TickerCore", targets: ["BitBay-TickerCore"]),
        .library(name: "BitBay-TickerMainHelpers", targets: ["BitBay-TickerMainHelpers"]),
    ],

    dependencies: [],

    targets: [
        .target(
            name: "BitBay-TickerCore",
            dependencies: []),
        .target(
            name: "BitBay-TickerMainHelpers",
            dependencies: ["BitBay-TickerCore"]),
        
        .target(
            name: "BitBay-Ticker",
            dependencies: ["BitBay-TickerMainHelpers"]),
        
        .testTarget(
            name: "BitBay-TickerCoreTests",
            dependencies: ["BitBay-TickerCore"]),
        .testTarget(
            name: "BitBay-TickerMainHelpersTests",
            dependencies: ["BitBay-TickerMainHelpers", "BitBay-TickerCoreTests"])
    ]
)
