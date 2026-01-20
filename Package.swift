// swift-tools-version:5.8
import PackageDescription

let package = Package(
    name: "KubraWallet",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "KubraWallet",
            targets: ["KubraWalletTargets"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/aws-amplify/aws-sdk-ios-spm.git", from: "2.36.0"),
        .package(url: "https://github.com/barenddev/CardStack.git", from: "1.0.0"),
        .package(url: "https://github.com/barenddev/SwiftySegmentedPicker.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "KubraWalletTargets",
            dependencies: [
                "KubraWallet",
                .product(name: "AWSS3", package: "aws-sdk-ios-spm"),
                .product(name: "AWSCognitoIdentityProvider", package: "aws-sdk-ios-spm"),
                .product(name: "CardStack", package: "CardStack"),
                .product(name: "SegmentedPicker", package: "SwiftySegmentedPicker"),
            ],
            path: "Sources/KubraWalletTargets"
        ),
        .binaryTarget(
            name: "KubraWallet",
            url: "https://ios-compiled-sdk-frameworks.s3.us-west-2.amazonaws.com/version/1.3.1/KubraWallet.zip",
            checksum: "bf7eef8c3ec1be8cb3e52e37a525b8d0824094dd023d510fcd8a3a5cedd64ee6"
        )
    ]
)
