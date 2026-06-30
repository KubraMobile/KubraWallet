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
            url: "https://ios-compiled-sdk-frameworks.s3.us-west-2.amazonaws.com/version/2.2.0/KubraWallet.zip",
            checksum: "877f7dfbf06fc7885f79f9a523b9302d9e8b3c1bec69a1ed2b18d0b9f355a562"
        )
    ]
)
