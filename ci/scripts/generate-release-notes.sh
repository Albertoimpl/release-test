#!/bin/bash
set -eoux

version=$(cat version/version)
milestone=${version}
organization="Albertoimpl"
repository="release-test"

java -jar /github-release-notes-generator.jar \
  --releasenotes.github.username="${GITHUB_USERNAME}" \
  --releasenotes.github.password="${GITHUB_TOKEN}" \
  --releasenotes.github.organization="${organization}" \
  --releasenotes.github.repository="${repository}" \
  "${milestone}" generated-release-notes/release-notes.md

echo "${version}" >generated-release-notes/version
echo v"${version}" >generated-release-notes/tag
