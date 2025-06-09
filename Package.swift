// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AWSInstanceManager",
    platforms: [
        .macOS(.v13) // Minimum macOS version for Mac App Store
    ],
    products: [
        .executable(
            name: "AWSInstanceManager",
            targets: ["AWSInstanceManager"]
        ),
    ],
    dependencies: [
        // AWS SDK for Swift - Mac App Store compliant
        .package(
            url: "https://github.com/awslabs/aws-sdk-swift",
            from: "0.40.0"
        ),
        // Additional dependencies can be added here as needed
    ],
    targets: [
        .executableTarget(
            name: "AWSInstanceManager",
            dependencies: [
                // Core AWS services needed for EC2 Instance Management
                .product(name: "AWSEC2", package: "aws-sdk-swift"),
                .product(name: "AWSSTS", package: "aws-sdk-swift"),
                .product(name: "AWSIAM", package: "aws-sdk-swift"),
                .product(name: "AWSCostExplorer", package: "aws-sdk-swift"),
                .product(name: "AWSCloudWatch", package: "aws-sdk-swift"),
                .product(name: "AWSClientRuntime", package: "aws-sdk-swift"),
                .product(name: "ClientRuntime", package: "aws-sdk-swift"),
            ],
            path: "AWSInstanceManager",
            resources: [
                .process("Assets.xcassets"),
                .process("Resources")
            ],
            swiftSettings: [
                .enableUpcomingFeature("BareSlashRegexLiterals"),
                .enableUpcomingFeature("ConciseMagicFile"),
                .enableUpcomingFeature("ForwardTrailingClosures"),
                .enableUpcomingFeature("ImplicitOpenExistentials"),
                .enableUpcomingFeature("StrictConcurrency"),
            ]
        ),
        .testTarget(
            name: "AWSInstanceManagerTests",
            dependencies: ["AWSInstanceManager"],
            path: "Tests"
        ),
    ]
)