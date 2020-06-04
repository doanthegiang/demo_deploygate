set -eo pipefail

xcodebuild -workspace AIO.xcworkspace \
            -scheme AIO \
            -sdk iphoneos \
            -configuration AppStoreDistribution \
            -archivePath $PWD/build/AIO.xcarchive \
            clean archive | xcpretty
