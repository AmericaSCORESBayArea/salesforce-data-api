#!/bin/bash

# This script is used to determine the last tag and commit hash, 
# and increment the version based on the last commit message.

# Author: Aleksandr Molchagin
# Date: 2024-07-08

# Retrieve the latest tag revision in the Git repository.
LATEST_TAG_REV=$(git rev-list --tags --max-count=1)
# Retrieve the latest commit revision in the current branch.
LATEST_COMMIT_REV=$(git rev-list HEAD --max-count=1)

# Check if a tag revision exists.
if [ -n "$LATEST_TAG_REV" ]; then
    # If a tag revision exists, get the latest tag.
    LATEST_TAG=$(git describe --tags "$(git rev-list --tags --max-count=1)")
else
    # If no tag revision exists, default to "v1.0.0".
    LATEST_TAG="v1.0.0"
fi

# Extract the last commit message.
LAST_COMMIT_MSG=$(git log -1 --pretty=%B)

# Function to increment version numbers.
increment_version() {
    local version=$1
    local part=$2
    local major minor patch

    IFS='.' read -r major minor patch <<< "$version"

    case $part in
        major)
            major=$((major + 1))
            minor=0
            patch=0
            ;;
        minor)
            minor=$((minor + 1))
            patch=0
            ;;
        patch)
            patch=$((patch + 1))
            ;;
    esac

    echo "$major.$minor.$patch"
}

# Determine which part of the version to increment.
if [[ "$LAST_COMMIT_MSG" == *"major"* ]]; then
    NEW_TAG=$(increment_version "$LATEST_TAG" "major")
elif [[ "$LAST_COMMIT_MSG" == *"minor"* ]]; then
    NEW_TAG=$(increment_version "$LATEST_TAG" "minor")
elif [[ "$LAST_COMMIT_MSG" == *"patch"* ]]; then
    NEW_TAG=$(increment_version "$LATEST_TAG" "patch")
else
    # If no keyword is found, default to incrementing the patch version.
    NEW_TAG=$(increment_version "$LATEST_TAG" "patch")
fi

# Compare the latest tag revision with the latest commit revision.
if [ "$LATEST_TAG_REV" != "$LATEST_COMMIT_REV" ]; then
    echo "$NEW_TAG+$(git rev-list HEAD --max-count=1 --abbrev-commit)"
else
    echo "$NEW_TAG"
fi
