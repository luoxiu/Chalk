// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "Crayon",
    products: [
        .library(name: "Crayon", targets: ["Crayon"]),
    ],
    dependencies: [
         .package(url: "https://github.com/jianstm/Rainbow", .upToNextMajor(from: "0.0.1"))
    ],
    targets: [
        .target(name: "Crayon", dependencies: ["Rainbow"]),
        .testTarget(name: "CrayonTests", dependencies: ["Crayon"]),
    ]
)
