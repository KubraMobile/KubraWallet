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
            url: "https://ios-compiled-sdk-frameworks.s3.us-west-2.amazonaws.com/version/1.3.0/KubraWallet.zip",
            checksum: "e0f300968b1d48065e3a922229d2c91a2b5148e5747696f42ce0208718017463"
        )
    ]
)
