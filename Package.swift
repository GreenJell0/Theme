// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Theme",
    platforms: [
        .iOS(.v9),
        .tvOS(.v10)
    ],
   products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Theme", targets: ["Theme"]),
    ],
    dependencies: [
        .package(name: "Signals", url: "git@github.com:artman/Signals.git", from: "6.1.0"),
    ],
    targets: [
        .target(
            name: "Theme",
            dependencies: ["Signals"],
            exclude: ["Info.plist"]),
        .testTarget(
            name: "ThemeTests",
            dependencies: ["Theme"]),
    ]
)
