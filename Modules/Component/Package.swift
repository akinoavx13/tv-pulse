// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Component",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "Component", targets: ["Component"])
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "7.0.0"))
    ],
    targets: [
        .target(name: "Component", dependencies: ["Kingfisher"])
    ]
)
