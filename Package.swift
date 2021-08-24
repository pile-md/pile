// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
        name: "pile",
        dependencies: [
            .package(url: "https://github.com/apple/swift-argument-parser.git", from: "0.4.0"),
            .package(url: "https://github.com/swift-server/swift-backtrace.git", from: "1.3.1"),
            .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
        ],
        targets: [
            // Targets are the basic building blocks of a package. A target can define a module or a test suite.
            // Targets can depend on other targets in this package, and on products in packages this package depends on.
            .target(
                    name: "pile",
                    dependencies: [
                        .product(name: "ArgumentParser", package: "swift-argument-parser"),
                        .product(name: "Backtrace", package: "swift-backtrace"),
                        .product(name: "Logging", package: "swift-log")
                    ]),
            .testTarget(
                    name: "pileTests",
                    dependencies: ["pile"]),
        ]
)
