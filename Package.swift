// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Zonda-Tickers",

    platforms: [
       .macOS(.v12)
    ],

    targets: [
        .executableTarget(
            name: "Zonda-Tickers",
            dependencies: []),

        .testTarget(
            name: "Zonda-TickersTests",
            dependencies: ["Zonda-Tickers"]),
    ]
)
