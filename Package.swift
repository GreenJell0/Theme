// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Theme",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .macOS(.v10_15),
    ],
   products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Theme", targets: ["Theme"]),
    ],
    targets: [
        .target(
            name: "Theme",
            path: "Sources/Theme",
            exclude: ["Info.plist"],
            resources: [.copy("PrivacyInfo.xcprivacy")]
        ),
        .testTarget(
            name: "ThemeTests",
            dependencies: ["Theme"]),
    ]
)
