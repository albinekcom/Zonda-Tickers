// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "BitBay-Ticker",

    targets: [
        .target(name: "BitBay-Ticker", dependencies: ["BitBay-TickerCore"]),
        .target(name: "BitBay-TickerCore")
    ]
)
