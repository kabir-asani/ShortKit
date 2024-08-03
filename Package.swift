// swift-tools-version: 5.5

import PackageDescription

let package = Package(
    name: "ShortKit",
	platforms: [
		.iOS(.v12)
	],
    products: [
        .library(
            name: "ShortKit",
            targets: ["ShortKit"]),
    ],
    targets: [
        .target(
            name: "ShortKit"),
        .testTarget(
            name: "ShortKitTests",
            dependencies: ["ShortKit"]),
    ]
)
