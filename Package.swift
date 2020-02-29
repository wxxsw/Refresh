// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Refresh",
    products: [
        .library(
            name: "Refresh",
            targets: ["Refresh"]),
    ],
    targets: [
        .target(
            name: "Refresh",
            dependencies: []),
        .testTarget(
            name: "RefreshTests",
            dependencies: ["Refresh"]),
    ]
)
