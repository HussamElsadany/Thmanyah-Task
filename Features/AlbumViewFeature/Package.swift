// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AlbumViewFeature",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AlbumViewFeature",
            targets: ["AlbumViewFeature"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(path: "../Domain"),
        .package(path: "../ThmanyahAPI"),
        .package(path: "../Extensions"),
        .package(path: "../ImageCache")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AlbumViewFeature",
            dependencies: ["Domain", "ThmanyahAPI", "Extensions", "ImageCache"]),
        .testTarget(
            name: "AlbumViewFeatureTests",
            dependencies: ["AlbumViewFeature"]),
    ]
)
