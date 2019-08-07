#!/usr/bin/env bash

set -euo pipefail

set_pipeline() {
  echo "Setting release pipeline..."
  fly -t scs set-pipeline -p release-test -c pipeline.yml -l config.yml -l params.yml
}

main() {
  fly -t scs sync

  pushd "$(dirname "$0")/.." >/dev/null

  set_pipeline

  popd >/dev/null
}

main
