#!/bin/bash

set -x
set -e

source acceptanceconfig

cat > PCFDataSample/Pivotal.plist << EOM
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>pivotal.auth.scopes</key>
  <string>openid offline_access</string>
  <key>pivotal.auth.tokenUrl</key>
  <string>$DATA_ACCEPTANCE_AUTH_URL/token</string>
  <key>pivotal.auth.authorizeUrl</key>
  <string>$DATA_ACCEPTANCE_AUTH_URL/authorize</string>
  <key>pivotal.auth.redirectUrl</key>
  <string>io.pivotal.ios.PCFDataSample://oauth2callback</string>
  <key>pivotal.auth.clientId</key>
  <string>$DATA_ACCEPTANCE_CLIENT_ID</string>
  <key>pivotal.auth.clientSecret</key>
  <string>$DATA_ACCEPTANCE_CLIENT_SECRET</string>
  <key>pivotal.data.serviceUrl</key>
  <string>$DATA_ACCEPTANCE_BACKEND_URL/data/$DATA_ACCEPTANCE_NAMESPACE</string>
  <key>pivotal.data.collisionStrategy</key>
  <string>OptimisticLocking</string>
</dict>
</plist>
EOM

gem install calabash-cucumber

echo "

y" | calabash-ios setup

xcodebuild -sdk iphoneos -project PCFDataSample.xcodeproj -target PCFDataSample-cal -config Debug clean build PROVISIONING_PROFILE="c36664a7-cd05-4879-aabd-1f9c89056961"
