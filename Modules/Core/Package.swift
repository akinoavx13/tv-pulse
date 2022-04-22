// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "Core", targets: ["Core"]),
        .library(name: "Networking", targets: ["Networking"])
    ],
    dependencies: [],
    targets: [
        .target(name: "Core", dependencies: []),
        .target(name: "Networking", dependencies: [])
    ]
)
