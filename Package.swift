// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Swapi",
    platforms: [
        .macOS(.v11), .iOS(.v13)
    ],
    products: [
        .library(
            name: "Swapi",
            targets: ["Swapi"]),
    ],
    targets: [
        .target(
            name: "Swapi",
            path: "Swapi/Swapi"
        ),
        .testTarget(
            name: "SwapiTests",
            dependencies: ["Swapi"],
            path: "Swapi/SwapiTests")
    ]
)
