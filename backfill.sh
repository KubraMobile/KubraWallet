#!/bin/bash
set -euo pipefail
cd /Users/barend/Documents/iOS/internal/KubraWallet
VERSIONS="1.0.0 1.1.3 1.1.4 1.2.1 1.3.0 1.3.1 1.3.2 1.3.3 1.3.4 1.4.0 1.4.1 1.4.2 1.4.3 1.5.0 1.6.0 1.6.1 1.6.2 1.6.3 1.6.4 1.7.0 1.8.0 1.9.0"
git config user.name "github-actions[bot]"
git config user.email "github-actions[bot]@users.noreply.github.com"
for VERSION in $VERSIONS; do
    echo "Processing ${VERSION}..."
    PODSPEC=$(curl -s "https://raw.githubusercontent.com/KubraMobile/MobilePodspecs/main/KubraWallet/${VERSION}/KubraWallet.podspec")
    URL=$(echo "$PODSPEC" | grep -o 'https://[^"]*KubraWallet\.zip')
    CHECKSUM=$(echo "$PODSPEC" | grep 'sha256' | grep -o '"[a-f0-9]\{64\}"' | tr -d '"')
    sed -i '' -e "s|url: \"https://ios-compiled-sdk-frameworks[^\"]*\"|url: \"${URL}\"|" -e "s|checksum: \"[a-f0-9]\{64\}\"|checksum: \"${CHECKSUM}\"|" Package.swift
    [ "$VERSION" = "1.0.0" ] && git add . || git add Package.swift
    git commit -m "Release ${VERSION}"
    git tag "${VERSION}"
done
echo "Done! $(git tag | wc -l | tr -d ' ') tags created."
