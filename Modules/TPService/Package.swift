// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TPService",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "TPService", targets: ["TPService"])
    ],
    dependencies: [
        .package(path: "./TPCore"),
        .package(path: "./Model")
    ],
    targets: [
        .target(name: "TPService", dependencies: ["TPCore", "Model"])
    ]
)
