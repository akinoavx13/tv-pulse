// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Service",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "TMDB", targets: ["TMDB"])
    ],
    dependencies: [
        .package(name: "Core", path: "./Core"),
        .package(name: "Model", path: "./Model")
    ],
    targets: [
        .target(name: "TMDB", dependencies: [
            "Core",
            "Model",
            .product(name: "Networking", package: "Core")
        ])
    ]
)
