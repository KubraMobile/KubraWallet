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
            url: "https://ios-compiled-sdk-frameworks.s3.us-west-2.amazonaws.com/version/1.8.0/KubraWallet.zip",
            checksum: "89afbef8f92fad96c59b62ad1bf2bffe5a883935259b8b62965b15302835c63a"
        )
    ]
)
