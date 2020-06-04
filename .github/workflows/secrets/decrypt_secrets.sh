#!/bin/sh
set -eo pipefail

gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output  /secrets/a842f066-55fa-4359-ab09-ddd4cc0aa829.mobileprovision /secrets/a842f066-55fa-4359-ab09-ddd4cc0aa829.mobileprovision.gpg
gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output /secrets/Certificates.p12 /secrets/Certificates.p12.gpg

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

cp ./.github/secrets/a842f066-55fa-4359-ab09-ddd4cc0aa829.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/a842f066-55fa-4359-ab09-ddd4cc0aa829.mobileprovision


security create-keychain -p "" build.keychain
security import ./.github/secrets/Certificates.p12 -t agg -k ~/Library/Keychains/build.keychain -P "" -A

security list-keychains -s ~/Library/Keychains/build.keychain
security default-keychain -s ~/Library/Keychains/build.keychain
security unlock-keychain -p "" ~/Library/Keychains/build.keychain

security set-key-partition-list -S apple-tool:,apple: -s -k "" ~/Library/Keychains/build.keychain
