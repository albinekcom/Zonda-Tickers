import PackageDescription

let package = Package(
    name: "BitBay-Ticker",

    targets: [
        Target(name: "BitBay-Ticker", dependencies: ["BitBay-TickerCore"]),
        Target(name: "BitBay-TickerCore")
    ]
)
