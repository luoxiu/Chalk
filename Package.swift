// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Chalk",
    products: [
        .library(name: "Chalk", targets: ["Chalk"]),
        .executable(name: "cli", targets: ["cli"]),
    ],
    dependencies: [
        .package(url: "https://github.com/luoxiu/Rainbow", from: "0.0.1"),
    ],
    targets: [
        .target(name: "Chalk", dependencies: ["Rainbow"]),
        .target(name: "cli", dependencies: ["Chalk"]),
        .testTarget(name: "ChalkTests", dependencies: ["Chalk"]),
    ]
)
