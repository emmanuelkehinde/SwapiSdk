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
        )
    ]
)
