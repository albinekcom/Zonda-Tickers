// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "BitBay-Ticker",

    targets: [
        .target(name: "BitBay-TickerCore"),
        .target(name: "BitBay-Ticker", dependencies: ["BitBay-TickerCore"]),
        .testTarget(name: "BitBay-TickerCoreTests", dependencies: ["BitBay-TickerCore"], path: "Tests")
    ]
)
