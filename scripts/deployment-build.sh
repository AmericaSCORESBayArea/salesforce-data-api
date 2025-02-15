#!/bin/bash

# This script is used to build the deployment package for the Mule application
#
# mvn needs to be installed in the environment to run this script
# Arguments:
# $1: keystore key password
# $2: keystore password
#
# Author: Aleksandr Molchagin
# Date: 2024-07-08

#0. GET ARGUMENTS
KEYSTORE_KEY_PASSWORD=${1:-password}
KEYSTORE_PASSWORD=${2:-password}


DIR="../src/main/mule"

## 1. RENAME FILES TO BUILD DEPLOYMENT PACKAGE
#if [ -f "$DIR/global.xml.anypoint" ]; then
#  # Rename global.xml to global.xml.local if it exists
#  if [ -f "$DIR/global.xml" ]; then
#    mv "$DIR/global.xml" "$DIR/global.xml.local"
#    echo "File 'global.xml' renamed to 'global.xml.local'."
#  fi
#
#  # Rename global.xml.anypoint to global.xml
#  mv "$DIR/global.xml.anypoint" "$DIR/global.xml"
#  echo "File 'global.xml.anypoint' renamed to 'global.xml'."
#else
#  echo "File 'global.xml.anypoint' does not exist."
#fi


# 2. GENERATE KEYSTORE USING KEYTOOL
keytool -genkeypair -keystore keystore.jks \
  -dname "CN=localhost, OU=Unknown, O=America SCORES Bay Area, L=San Francisco, ST=California, C=US" \
  -keypass $KEYSTORE_KEY_PASSWORD \
  -storepass $KEYSTORE_PASSWORD \
  -keyalg RSA \
  -sigalg SHA1withRSA \
  -keysize 2048 \
  -alias mule \
  -ext SAN=DNS:localhost,IP:127.0.0.1 \
  -validity 9999
mv keystore.jks ../src/main/resources

#3. BUILD .JAR FILE
echo "Building deployment package..."
mvn -B package --file ../pom.xml


##4. RENAME FILES BACK TO RUN IT LOCALLY
#if [ -f "$DIR/global.xml.local" ]; then
#  # Rename global.xml to global.xml.anypoint if it exists
#  if [ -f "$DIR/global.xml" ]; then
#    mv "$DIR/global.xml" "$DIR/global.xml.anypoint"
#    echo "File 'global.xml' renamed BACK to 'global.xml.anypoint'."
#  fi
#
#  # Rename global.xml.local to global.xml
#  mv "$DIR/global.xml.local" "$DIR/global.xml"
#  echo "File 'global.xml.local' renamed BACK to 'global.xml'."
#else
#  echo "File 'global.xml.local' does not exist."
#fi

#5. APPEND LAST COMMIT HASH TO FILE

if [ -z "$GITHUB_SHA" ]; then
  echo "GITHUB_SHA is not set. Fetching the latest commit hash from git..."
  LAST_COMMIT_HASH=$(git rev-parse --short HEAD)
else
  LAST_COMMIT_HASH=$(git rev-parse --short "$GITHUB_SHA")
fi
echo "The last commit hash on the current branch is: $LAST_COMMIT_HASH"
mv "../target/salesforce-data-api-1.0.0-SNAPSHOT-mule-application.jar" "../target/salesforce-data-api-$LAST_COMMIT_HASH.jar"


#6. IF MAC, OPEN TARGET FOLDER
if [ "$(uname)" == "Darwin" ]; then
  open ./target
fi
