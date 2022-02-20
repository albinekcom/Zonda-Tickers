// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Zonda-Tickers",

    platforms: [
       .macOS(.v12)
    ],

    targets: [
        .executableTarget(
            name: "Zonda-Tickers"
        ),

        .testTarget(
            name: "Zonda-TickersTests",
            dependencies: ["Zonda-Tickers"]
        ),
    ]
)
