// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Feature",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "WatchList", targets: ["WatchList"]),
        .library(name: "Discover", targets: ["Discover"]),
        .library(name: "TVShowDetail", targets: ["TVShowDetail"])
    ],
    dependencies: [
        .package(name: "Core", path: "./Core"),
        .package(name: "Service", path: "./Service"),
        .package(name: "Component", path: "./Component"),
        .package(url: "https://github.com/mac-cain13/R.swift.Library", from: "5.4.0"),
        .package(url: "https://github.com/quentinfasquel/R.swift.Plugin", from: "5.4.0")
    ],
    targets: [
        .target(name: "WatchList",
                dependencies: [
                    "Core"
                ]
               ),
        .target(name: "Discover",
                dependencies: [
                    "Core",
                    "Component",
                    "TVShowDetail",
                    .product(name: "TMDB", package: "Service"),
                    .product(name: "RswiftDynamic", package: "R.swift.Library")
                ],
//                resources: [
//                    .copy("Localizable.strings")
//                ],
                plugins: [.plugin(name: "RswiftPlugin", package: "R.swift.Plugin")]
               ),
        .target(name: "TVShowDetail",
                dependencies: [
                    "Core"
                ]
               )
    ]
)
