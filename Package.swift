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
        // CardStack and SegmentedPicker are now vendored directly in the xcframework
    ],
    targets: [
        .target(
            name: "KubraWalletTargets",
            dependencies: [
                "KubraWallet",
                .product(name: "AWSS3", package: "aws-sdk-ios-spm"),
                .product(name: "AWSCognitoIdentityProvider", package: "aws-sdk-ios-spm"),
            ],
            path: "Sources/KubraWalletTargets"
        ),
        // SPM support begins with version 1.10.0
        // This URL will be updated by CI when 1.10.0 is released
        .binaryTarget(
            name: "KubraWallet",
            url: "https://ios-compiled-sdk-frameworks.s3.us-west-2.amazonaws.com/version/1.10.0/KubraWallet.zip",
            checksum: "0000000000000000000000000000000000000000000000000000000000000000"
        )
    ]
)
