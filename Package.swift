// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CieidPlugin",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "CieidPlugin",
            targets: ["CieIdPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", branch: "main")
    ],
    targets: [
        .target(
            name: "CieIdPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/CieIdPlugin"),
        .testTarget(
            name: "CieIdPluginTests",
            dependencies: ["CieIdPlugin"],
            path: "ios/Tests/CieIdPluginTests")
    ]
)
