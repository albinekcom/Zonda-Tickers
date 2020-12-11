// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "BitBay-Ticker",
    dependencies: [],

    targets: [
        .target(
            name: "BitBay-Ticker",
            dependencies: []),
        .testTarget(
            name: "BitBay-TickerTests",
            dependencies: ["BitBay-Ticker"])
    ]
)
