# KubraWallet SDK

iOS SDK for KUBRA payment and wallet management.

## Requirements

- iOS 16.4+
- Xcode 14.0+
- Swift 5.8+

## Installation

### Swift Package Manager

Add the package dependency in Xcode:

1. File > Add Package Dependencies
2. Enter: `https://github.com/KubraMobile/KubraWallet.git`
3. Select version rule (e.g., "Up to Next Major")
4. Add `KubraWallet` to your target

Or add to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/KubraMobile/KubraWallet.git", from: "1.0.0")
]
```

### CocoaPods

Add to your Podfile:

```ruby
pod 'KubraWallet'
```

## Usage

```swift
import KubraWallet

let kubraWallet = KubraWalletManager()
kubraWallet.beginEnrolledPayment(
    subscriberId: subscriberId,
    accountNumber: accountNumber,
    clientKey: "provided_client_key",
    isProd: false
) { paymentStatus, confirmationNumber in
    print("Payment status: \(paymentStatus)")
}
```

## Documentation

For complete documentation, contact KUBRA support.
