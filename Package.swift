// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Chalk",
    products: [
        .library(name: "Chalk", targets: ["Chalk"]),
    ],
    dependencies: [
        .package(url: "https://github.com/luoxiu/Rainbow", from: "0.0.1"),
    ],
    targets: [
        .target(name: "Chalk", dependencies: ["Rainbow"]),
        .testTarget(name: "ChalkTests", dependencies: ["Chalk"]),
    ]
)
