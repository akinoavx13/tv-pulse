// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Feature",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "WatchList", targets: ["WatchList"]),
        .library(name: "Discover", targets: ["Discover"])
    ],
    dependencies: [
        .package(name: "Core", path: "./Core"),
        .package(name: "Service", path: "./Service"),
        .package(name: "Component", path: "./Component")
    ],
    targets: [
        .target(name: "WatchList", dependencies: [
            "Core"
        ]),
        .target(name: "Discover", dependencies: [
            "Core",
            "Component",
            .product(name: "TMDB", package: "Service")
        ])
    ]
)
