// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "XcodeCoverageConverter",
    products: [
        .executable(name: "xcc", targets: ["XcodeCoverageConverter"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.0.6")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "XcodeCoverageConverter",
            dependencies: [.product(name: "ArgumentParser", package: "swift-argument-parser"), "Readers", "Converters", "Filters"],
            path: "Sources/XcodeCoverageConverter"),
        .target(
            name: "Commons",
            dependencies: [],
            path: "Sources/Commons"),
        .target(
            name: "Readers",
            dependencies: ["Commons"],
            path: "Sources/Readers"),
        .target(
            name: "Converters",
            dependencies: ["Commons"],
            path: "Sources/Converters"),
        .target(
            name: "Filters",
            dependencies: ["Commons"],
            path: "Sources/Filters"),
        .testTarget(
            name: "XcodeCoverageConverterTests",
            dependencies: ["XcodeCoverageConverter"],
            path: "Tests/XcodeCoverageConverterTests"),
        .testTarget(
            name: "CommonsTests",
            dependencies: ["Commons"],
            path: "Tests/Commons"),
        .testTarget(
            name: "ReadersTests",
            dependencies: ["Readers"],
            path: "Tests/ReadersTests"),
        .testTarget(
            name: "ConvertersTests",
            dependencies: ["Converters"],
            path: "Tests/ConvertersTests"),
        .testTarget(
            name: "FiltersTests",
            dependencies: ["Filters"],
            path: "Tests/FiltersTests"),
    ]
)
