// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "BitBay-Ticker",

    dependencies: [],

    targets: [
        .target(
            name: "BitBay-TickerCore",
            dependencies: []),

        .target(
            name: "BitBay-Ticker",
            dependencies: ["BitBay-TickerCore"]),

        .testTarget(
            name: "BitBay-TickerCoreTests",
            dependencies: ["BitBay-TickerCore"])
    ]
)
