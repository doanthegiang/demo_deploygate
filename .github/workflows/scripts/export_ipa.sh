#!/bin/bash

set -eo pipefail

xcodebuild -archivePath $PWD/build/AIO.xcarchive \
            -exportOptionsPlist AIO/Info.plist \
            -exportPath $PWD/build \
            -allowProvisioningUpdates \
            -exportArchive | xcpretty
