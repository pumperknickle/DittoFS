// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DittoFS",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "DittoFS",
            targets: ["DittoFS"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pumperknickle/Regenerate.git", from: "2.0.4"),
        .package(url: "https://github.com/pumperknickle/Ditto.git", from: "0.0.1"),
        .package(url: "https://github.com/pumperknickle/HashedFileSystem.git", from: "0.0.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "DittoFS",
            dependencies: ["Ditto", "HashedFS", "Regenerate"]),
        .testTarget(
            name: "DittoFSTests",
            dependencies: ["DittoFS"]),
    ]
)
