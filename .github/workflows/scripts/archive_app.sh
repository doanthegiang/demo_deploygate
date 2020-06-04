set -eo pipefail

xcodebuild -workspace AIO.xcworkspace \
            -scheme AIO\ iOS \
            -sdk iphoneos \
            -configuration AppStoreDistribution \
            -archivePath $PWD/build/AIO.xcarchive \
            clean archive | xcpretty
